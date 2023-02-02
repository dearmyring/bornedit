package com.example.bornedit.repository;

import com.example.bornedit.entity.TripodDto;

public interface TripodDao {
	int sequence();
	void write(TripodDto tripodDto);
}
