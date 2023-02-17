package com.example.bornedit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.example.bornedit.repository.CertificationDao;

@Service
public class SchedulerServiceImpl implements SchedulerService{
	@Autowired
	private CertificationDao certificationDao;
	
	@Scheduled(fixedRate = 1000)
	@Override
	public void clearCertification() {
		certificationDao.clear();
	}
}
