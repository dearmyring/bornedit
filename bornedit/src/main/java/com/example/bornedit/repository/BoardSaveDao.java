package com.example.bornedit.repository;

import com.example.bornedit.entity.BoardSaveDto;

public interface BoardSaveDao {
	boolean insert(BoardSaveDto boardSaveDto);
	boolean check(BoardSaveDto boardSaveDto);
	boolean delete(BoardSaveDto boardSaveDto);
}
