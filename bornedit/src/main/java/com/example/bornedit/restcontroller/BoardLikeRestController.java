package com.example.bornedit.restcontroller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.bornedit.constant.SessionConstant;
import com.example.bornedit.entity.BoardLikeDto;
import com.example.bornedit.repository.BoardDao;
import com.example.bornedit.repository.BoardLikeDao;
import com.example.bornedit.vo.LikeCountVO;

@RestController
@RequestMapping("/rest")
public class BoardLikeRestController {
	
	@Autowired
	private BoardLikeDao boardLikeDao;
	
	@Autowired
	private BoardDao boardDao;
	
	@PostMapping("/like/view")
	public boolean likeView(@RequestBody BoardLikeDto boardLikeDto, HttpSession session) {
		String memberId = (String) session.getAttribute(SessionConstant.ID);
		boardLikeDto.setMemberEmail(memberId);
		return boardLikeDao.check(boardLikeDto);
	}
	
	@PostMapping("/like/check")
	public String like(@RequestBody BoardLikeDto boardLikeDto, HttpSession session) {
		String memberId = (String) session.getAttribute(SessionConstant.ID);
		boardLikeDto.setMemberEmail(memberId);
		boolean judge = boardLikeDao.check(boardLikeDto);
		if(judge) {
			boardDao.incrementLikeCount(boardLikeDto.getBoardNo());
			boardLikeDao.insert(boardLikeDto);
			return "like";
		} else {
			boardDao.decrementLikeCount(boardLikeDto.getBoardNo());
			boardLikeDao.delete(boardLikeDto);
			return "unlike";
		}
	}
	
	@GetMapping("/like/count/{boardNo}")
	public LikeCountVO count(@PathVariable int boardNo) {
		return boardLikeDao.likeCount(boardNo);
	}
}
