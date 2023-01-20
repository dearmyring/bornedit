package com.example.bornedit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.bornedit.entity.CertificationDto;
import com.example.bornedit.entity.MemberDto;
import com.example.bornedit.repository.MemberDao;
import com.example.bornedit.service.EmailService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private EmailService emailService;
	
	@GetMapping("/join")
	public String join() {
		return "member/join";
	}
	
	@PostMapping("/join")
	public String join(@ModelAttribute MemberDto memberDto) {
		memberDao.join(memberDto);
		return "redirect:join_success";
	}
	
	@PostMapping("/send-email")
	@ResponseBody
	public void sendEmail(@RequestParam String CertificationEmail) {
		emailService.sendCertMail(CertificationEmail);
	}
	
	@PostMapping("/confirm_email")
	@ResponseBody
	public boolean confirmEmail(@ModelAttribute CertificationDto certDto) {
		return emailService.checkCert(certDto);
	}
	
	@GetMapping("/join_success")
	public String joinSuccess() {
		return "member/success";
	}
	
}
