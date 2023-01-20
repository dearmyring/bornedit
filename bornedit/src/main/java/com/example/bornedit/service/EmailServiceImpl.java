package com.example.bornedit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.example.bornedit.component.RandomSerial;
import com.example.bornedit.entity.CertificationDto;
import com.example.bornedit.repository.CertificationDao;

@Service
public class EmailServiceImpl implements EmailService{

	@Autowired
	private RandomSerial randomSerial;
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	@Autowired
	private CertificationDao certificationDao;
	
	@Override
	public void sendCertMail(String email) {
		String serial = randomSerial.makeSerial(6);
		
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(email);
		message.setSubject("[BORNEDIT] 인증번호입니다.");
		message.setText("인증번호 : " + serial);
		javaMailSender.send(message);
		
		certificationDao.delete(email);
		CertificationDto certDto = CertificationDto.builder().certificationEmail(email).certificationSerial(serial).build();
		certificationDao.insert(certDto);
	}
	
	@Override
	public boolean checkCert(CertificationDto certDto) {
		if(certificationDao.check(certDto)) {
			certificationDao.delete(certDto.getCertificationEmail());
			return true;
		}	
			return false;
	}
	
}
