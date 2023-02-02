package com.example.bornedit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.bornedit.constant.SessionConstant;
import com.example.bornedit.entity.BoardDto;
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
			@RequestParam String bodyName,
			@RequestParam String lensName,
			@RequestParam String tripodName,
			@RequestParam String audioName,
			@RequestParam String monitorName,
			@RequestParam String rightName,
			@RequestParam String etcName,
			HttpSession session
			) {
		int boardNo = boardDao.sequence();
		String memberId = (String) session.getAttribute(SessionConstant.ID);
		boardDto.setBoardNo(boardNo);
		boardDto.setMemberEmail(memberId);
		boardDao.write(boardDto);
		return "home";
	}
}
