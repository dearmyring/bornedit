package com.example.bornedit.restcontroller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.bornedit.constant.SessionConstant;
import com.example.bornedit.entity.ReplyDto;
import com.example.bornedit.repository.ReplyDao;
import com.example.bornedit.vo.ReplyCountVO;
import com.example.bornedit.vo.ReplyVO;

@RestController
@RequestMapping("/rest")
public class ReplyRestController {
	@Autowired
	private ReplyDao replyDao;
	
	@GetMapping("/reply/list/{boardNo}")
	public List<ReplyVO> replyList(@PathVariable int boardNo) {
		return replyDao.selectReply(boardNo);
	}
	
	@GetMapping("/reply/count/{boardNo}")
	public ReplyCountVO count(@PathVariable int boardNo) {
		return replyDao.count(boardNo);
	}
	
	@PostMapping("/reply/write")
	public void replyWrite(@RequestBody ReplyDto replyDto, HttpSession session) {
		String memberEmail = (String) session.getAttribute(SessionConstant.ID);
		replyDto.setMemberEmail(memberEmail);
		replyDao.write(replyDto);
	}
	
	@DeleteMapping("/reply/delete/{replyNo}")
	public boolean delete(@PathVariable int replyNo) {
		return replyDao.delete(replyNo);
	}
	
}
