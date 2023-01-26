package com.example.bornedit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.bornedit.constant.SessionConstant;
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
	
	@Autowired
	private PasswordEncoder encoder;
	
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
	public void sendEmail(@RequestParam String certificationEmail) {
		emailService.sendCertMail(certificationEmail);
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
	
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	@PostMapping("/login")
	public String login(HttpSession session, MemberDto inputDto) {
		MemberDto findDto = memberDao.selectOndId(inputDto.getMemberEmail());
		if(findDto == null) {
			return "redirect:login?error";
		}
		boolean judge = encoder.matches(inputDto.getMemberPw(), findDto.getMemberPw());
		if(judge) {
			session.setAttribute(SessionConstant.ID, findDto.getMemberEmail());
			session.setAttribute(SessionConstant.NICK, findDto.getMemberNick());
			memberDao.updateLoginTime(inputDto.getMemberEmail());
			return "redirect:/";
		} 
		else {
			return "redirect:login?error";
		}
	} 
	
	
}
