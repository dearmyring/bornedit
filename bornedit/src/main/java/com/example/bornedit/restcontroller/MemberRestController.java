package com.example.bornedit.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.bornedit.entity.CertificationDto;
import com.example.bornedit.entity.MemberDto;
import com.example.bornedit.repository.CertificationDao;
import com.example.bornedit.repository.MemberDao;
import com.example.bornedit.service.EmailService;

import io.swagger.v3.oas.annotations.parameters.RequestBody;

@RestController
@RequestMapping("/rest/member")
public class MemberRestController {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private CertificationDao certificationDao;
	
	@Autowired
	private EmailService emailService;
	
	@GetMapping("/email/{memberEmail}")
	public String findId(@PathVariable String memberEmail) {
		MemberDto memberDto = memberDao.selectOndId(memberEmail);
		if(memberDto == null) {
			return "NNNNY";
		} else {
			return "NNNNN";
		}
	}
	
	@GetMapping("/nick/{memberNick}")
	public String findNick(@PathVariable String memberNick) {
		MemberDto memberDto = memberDao.selectOndNick(memberNick);
		if(memberDto == null) {
			return "NNNNY";
		} else {
			return "NNNNN";
		}
	}
	
	@PostMapping("/send_email")
	public void sendEmail(@RequestParam String certificationEmail) {
		emailService.sendCertMail(certificationEmail);
	}
	
	@GetMapping("/confirm_email")
	public String confirmEmail(@ModelAttribute CertificationDto inputDto) {
		CertificationDto findDto = certificationDao.check(inputDto);
		System.out.println();
		if(findDto == null) {
			return "NNNNN";
		} else {
			return "NNNNY";
		}
	}
	
}
