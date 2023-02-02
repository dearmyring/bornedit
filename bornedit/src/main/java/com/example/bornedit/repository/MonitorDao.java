package com.example.bornedit.repository;

import com.example.bornedit.entity.MonitorDto;

public interface MonitorDao {
	int sequence();
	void write(MonitorDto monitorDto);
	
}
