package com.example.bornedit.repository;

import com.example.bornedit.entity.BodyDto;

public interface BodyDao {
	int sequence();
	void write(BodyDto bodyDto);
}
