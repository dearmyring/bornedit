package com.example.bornedit.repository;

import com.example.bornedit.entity.EtcDto;

public interface EtcDao {
	int sequence();
	void write(EtcDto etcDto);
}
