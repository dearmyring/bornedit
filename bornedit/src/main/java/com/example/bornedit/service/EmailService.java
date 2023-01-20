package com.example.bornedit.service;

import com.example.bornedit.entity.CertificationDto;

public interface EmailService {
	void sendCertMail(String email);
	boolean checkCert(CertificationDto certDto);
}
