package com.example.bornedit.repository;

import com.example.bornedit.entity.BoardLikeDto;
import com.example.bornedit.vo.LikeCountVO;

public interface BoardLikeDao {
	boolean insert(BoardLikeDto boardLikeDto);
	boolean check(BoardLikeDto boardLikeDto);
	boolean delete(BoardLikeDto boardLikeDto);
	LikeCountVO likeCount(int boardNo);
}
