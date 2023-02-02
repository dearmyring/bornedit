package com.example.bornedit.repository;

import com.example.bornedit.entity.LensDto;

public interface LensDao {
	int sequence();
	void write(LensDto lensDto);
}
