package com.example.bornedit.repository;

import com.example.bornedit.entity.BoardDto;

public interface BoardDao {
	int sequence();
	void write(BoardDto boardDto);
}
