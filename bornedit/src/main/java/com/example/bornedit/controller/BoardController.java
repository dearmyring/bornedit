package com.example.bornedit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.bornedit.constant.SessionConstant;
import com.example.bornedit.entity.AudioDto;
import com.example.bornedit.entity.BoardDto;
import com.example.bornedit.entity.BodyDto;
import com.example.bornedit.entity.EtcDto;
import com.example.bornedit.entity.LensDto;
import com.example.bornedit.entity.MonitorDto;
import com.example.bornedit.entity.RightDto;
import com.example.bornedit.entity.TripodDto;
import com.example.bornedit.repository.AudioDao;
import com.example.bornedit.repository.BoardDao;
import com.example.bornedit.repository.BodyDao;
import com.example.bornedit.repository.EtcDao;
import com.example.bornedit.repository.LensDao;
import com.example.bornedit.repository.MonitorDao;
import com.example.bornedit.repository.RightDao;
import com.example.bornedit.repository.TripodDao;

@Controller
@RequestMapping("/board")

public class BoardController {

	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private BodyDao bodyDao;
	
	@Autowired
	private LensDao lensDao;
	
	@Autowired
	private TripodDao tripodDao;
	
	@Autowired
	private AudioDao audioDao;
	
	@Autowired
	private MonitorDao monitorDao;
	
	@Autowired
	private RightDao rightDao;
	
	@Autowired
	private EtcDao etcDao;
	
	@GetMapping("/write")
	public String write() {
		return "board/write";
	}
	
	@PostMapping("/write")
	public String write(
			@ModelAttribute BoardDto boardDto,
			@RequestParam List<String> bodyName,
			@RequestParam List<String> lensName,
			@RequestParam List<String> tripodName,
			@RequestParam List<String> audioName,
			@RequestParam List<String> monitorName,
			@RequestParam List<String> rightName,
			@RequestParam List<String> etcName,
			HttpSession session
			) {
		int boardNo = boardDao.sequence();
		String memberId = (String) session.getAttribute(SessionConstant.ID);
		boardDto.setBoardNo(boardNo);
		boardDto.setMemberEmail(memberId);
		boardDao.write(boardDto);
		
		System.out.println(boardDto);
		System.out.println(bodyName.size());
		System.out.println(lensName.size());
		System.out.println(tripodName.size());
		System.out.println(audioName.size());
		System.out.println(monitorName.size());
		System.out.println(rightName.size());
		System.out.println(etcName.size());
		
		for(int i = 0; i < bodyName.size(); i++) {
			int bodyNo = bodyDao.sequence();
			BodyDto bodyDto = BodyDto.builder().boardNo(boardNo).bodyNo(bodyNo).bodyName(bodyName.get(i)).build();
			bodyDao.write(bodyDto);
		}
		
		for(int i = 0; i < lensName.size(); i++) {
			int lensNo = lensDao.sequence();
			LensDto lensDto = LensDto.builder().boardNo(boardNo).lensNo(lensNo).lensName(lensName.get(i)).build();
			lensDao.write(lensDto);
		}
		
		for(int i = 0; i < tripodName.size(); i++) {
			int tripodNo = tripodDao.sequence();
			TripodDto tripodDto = TripodDto.builder().boardNo(boardNo).tripodNo(tripodNo).tripodName(tripodName.get(i)).build();
			tripodDao.write(tripodDto);
		}
		
		for(int i = 0; i < audioName.size(); i++) {
			int audioNo = audioDao.sequence();
			AudioDto audioDto = AudioDto.builder().boardNo(boardNo).audioNo(audioNo).audioName(audioName.get(i)).build();
			audioDao.write(audioDto);
		}
		
		for(int i = 0; i < monitorName.size(); i++) {
			int monitorNo = monitorDao.sequence();
			MonitorDto monitorDto = MonitorDto.builder().boardNo(boardNo).monitorNo(monitorNo).monitorName(monitorName.get(i)).build();
			monitorDao.write(monitorDto);
		}
		
		for(int i = 0; i < rightName.size(); i++) {
			int rightNo = rightDao.sequence();
			RightDto rightDto = RightDto.builder().boardNo(boardNo).rightNo(rightNo).rightName(rightName.get(i)).build();
			rightDao.write(rightDto);
		}
		
		for(int i = 0; i < etcName.size(); i++) {
			int etcNo = etcDao.sequence();
			EtcDto etcDto = EtcDto.builder().boardNo(boardNo).etcNo(etcNo).etcName(etcName.get(i)).build();
			etcDao.write(etcDto);
		}
		
		return "home";
	}
}
