package com.example.bornedit.repository;

import com.example.bornedit.entity.CertificationDto;

public interface CertificationDao {
	void insert(CertificationDto certDto);
	CertificationDto check(CertificationDto certDto);
	boolean delete(String certificationEmail);
	void clear();
}
