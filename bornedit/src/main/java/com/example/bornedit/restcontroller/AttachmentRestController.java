package com.example.bornedit.restcontroller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.example.bornedit.constant.SessionConstant;
import com.example.bornedit.entity.AttachmentDto;
import com.example.bornedit.entity.ProfileImgDto;
import com.example.bornedit.repository.AttachmentDao;

@RestController
@RequestMapping("/rest")
public class AttachmentRestController {
	
	private File dir = new File(System.getProperty("user.home"), "/upload/bornedit");
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@PostMapping("/upload")
	public String upload(@RequestParam MultipartFile attach) throws IllegalStateException, IOException {
		
		int attachmentNo = attachmentDao.sequence();
		
		attachmentDao.uploadFile(AttachmentDto.builder()
				.attachmentNo(attachmentNo)
				.attachmentName(attach.getOriginalFilename())
				.attachmentType(attach.getContentType())
				.attachmentSize(attach.getSize())
				.build());
		
		dir.mkdirs();
		File target = new File(dir, String.valueOf(attachmentNo));
		attach.transferTo(target);
		
		return ServletUriComponentsBuilder.fromCurrentContextPath()
				.path("rest/download/")
				.path(String.valueOf(attachmentNo))
				.toUriString();
	}
	
	@GetMapping("/download/{attachmentNo}")
	public ResponseEntity<ByteArrayResource> download(
												@PathVariable int attachmentNo) throws IOException {
		AttachmentDto attachmentDto = attachmentDao.findFile(attachmentNo);
		if(attachmentDto == null) {
			throw new IllegalArgumentException();
		}
		
		File target = new File(dir, String.valueOf(attachmentDto.getAttachmentNo()));
		if(!target.exists()) {
			throw new IllegalArgumentException();
		}
		
		byte[] data = FileUtils.readFileToByteArray(target);
		ByteArrayResource resource = new ByteArrayResource(data);
		
		return ResponseEntity.ok()
					.header(
							HttpHeaders.CONTENT_ENCODING, 
							StandardCharsets.UTF_8.name()
					)
					.header(
							HttpHeaders.CONTENT_TYPE,
							attachmentDto.getAttachmentType()
					)
					.header(
							HttpHeaders.CONTENT_DISPOSITION,
							ContentDisposition.attachment()
								.filename(
										attachmentDto.getAttachmentName(), 
										StandardCharsets.UTF_8
							).build().toString()
					)
					.contentLength(attachmentDto.getAttachmentSize())
					.body(resource);
	}
	
	@PostMapping("/profileImg")
	public void addImage(@RequestParam String attachmentNo, HttpSession session) {
		
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		
		ProfileImgDto confirm = attachmentDao.selectProfileImg(loginId);
		
		if(confirm == null) {
			attachmentDao.addProfileImg(ProfileImgDto.builder()
					.memberEmail(loginId)
					.attachmentNo(Integer.parseInt(attachmentNo))
					.build());
		} else {
			attachmentDao.editProfileImg(ProfileImgDto.builder()
					.memberEmail(loginId)
					.attachmentNo(Integer.parseInt(attachmentNo))
					.build());
		}
	}
	
	@GetMapping("/PersonalImgNo/{memberEmail}")
	public ProfileImgDto PersonalImgNo(@PathVariable String memberEmail) {
		return attachmentDao.selectProfileImg(memberEmail);
	}
	
	@DeleteMapping("/deleteImgNo/{memberEmail}")
	public boolean deleteImgNo(@PathVariable String memberEmail) {
		return attachmentDao.deleteProfileImg(memberEmail);
	}
}
