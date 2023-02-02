package com.example.bornedit.repository;

import com.example.bornedit.entity.AudioDto;

public interface AudioDao {
	int sequence();
	void write(AudioDto audioDto);
}
