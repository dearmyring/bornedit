package com.example.bornedit.repository;

import java.util.List;

import com.example.bornedit.entity.BoardDto;
import com.example.bornedit.vo.BoardDetailVO;

public interface BoardDao {
	int sequence();
	void write(BoardDto boardDto);
	BoardDto selectOneBoard(int boardNo);
	List<BoardDetailVO> detail(int boardNo);
	boolean incrementViewCount(int boardNo);
	boolean incrementLikeCount(int boardNo);
	boolean decrementLikeCount(int boardNo);
	boolean incrementSaveCount(int boardNo);
	boolean decrementSaveCount(int boardNo);
}
