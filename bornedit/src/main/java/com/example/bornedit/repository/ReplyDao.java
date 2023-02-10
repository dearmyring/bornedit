package com.example.bornedit.repository;

import java.util.List;

import com.example.bornedit.entity.ReplyDto;
import com.example.bornedit.vo.ReplyCountVO;
import com.example.bornedit.vo.ReplyVO;

public interface ReplyDao {
	List<ReplyVO> selectReply(int boardNo);
	ReplyCountVO count(int boardNo);
	void write(ReplyDto replyDto);
	boolean delete(int replyNo);
	boolean edit(ReplyDto replyDto);
}
