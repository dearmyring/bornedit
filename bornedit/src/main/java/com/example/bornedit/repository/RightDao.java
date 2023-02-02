package com.example.bornedit.repository;

import com.example.bornedit.entity.RightDto;

public interface RightDao {
	int sequence();
	void write(RightDto rightDto);
}
