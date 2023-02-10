package com.example.bornedit.restcontroller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.bornedit.constant.SessionConstant;
import com.example.bornedit.entity.BoardSaveDto;
import com.example.bornedit.repository.BoardDao;
import com.example.bornedit.repository.BoardSaveDao;

@RestController
@RequestMapping("/rest")
public class BoardSaveRestController {
	
	@Autowired
	private BoardSaveDao boardSaveDao;
	
	@Autowired
	private BoardDao boardDao;
	
	@PostMapping("/save/view")
	public boolean saveView(@RequestBody BoardSaveDto boardSaveDto, HttpSession session) {
		String memberId = (String) session.getAttribute(SessionConstant.ID);
		boardSaveDto.setMemberEmail(memberId);
		return boardSaveDao.check(boardSaveDto);
	}
	
	@PostMapping("/save/check")
	public String save(@RequestBody BoardSaveDto boardSaveDto, HttpSession session) {
		String memberId = (String) session.getAttribute(SessionConstant.ID);
		boardSaveDto.setMemberEmail(memberId);
		boolean judge = boardSaveDao.check(boardSaveDto);
		if(judge) {
			boardDao.incrementSaveCount(boardSaveDto.getBoardNo());
			boardSaveDao.insert(boardSaveDto);
			return "save";
		} else {
			boardDao.decrementSaveCount(boardSaveDto.getBoardNo());
			boardSaveDao.delete(boardSaveDto);
			return "unsave";
		}
	}

}
