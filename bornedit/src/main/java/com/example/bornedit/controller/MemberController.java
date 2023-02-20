package com.example.bornedit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.bornedit.constant.SessionConstant;
import com.example.bornedit.entity.MemberDto;
import com.example.bornedit.repository.AttachmentDao;
import com.example.bornedit.repository.MemberDao;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
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
	
	@GetMapping("/join_success")
	public String joinSuccess() {
		return "member/success";
	}
	
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	@PostMapping("/login")
	public String login(HttpSession session, @ModelAttribute MemberDto inputDto) {
		MemberDto findDto = memberDao.selectOndId(inputDto.getMemberEmail());
		
		if(findDto == null) {
			return "redirect:login?error";
		}
		
		boolean judge = encoder.matches(inputDto.getMemberPw(), findDto.getMemberPw());
		
		if(judge) {
			session.setAttribute(SessionConstant.ID, findDto.getMemberEmail());
			session.setAttribute(SessionConstant.NICK, findDto.getMemberNick());
			memberDao.updateLoginTime(findDto.getMemberEmail());
			return "redirect:/";
		} 
		else {
			return "redirect:login?error";
		}
	} 
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute(SessionConstant.ID);
		session.removeAttribute(SessionConstant.NICK);
		return "redirect:/";
	}
	
	@GetMapping("find_pw")
	public String findPw() {
		return "member/find_pw";
	}
	
	@PostMapping("find_pw")
	public String findPw(@RequestParam String memberEmail, RedirectAttributes attr) {
		MemberDto findDto = memberDao.selectOndId(memberEmail);
		if(findDto == null) {
			return "redirect:find_pw?error";
		}
		attr.addAttribute("memberEmail", memberEmail);
		return "redirect:edit_pw";
	}
	
	@GetMapping("edit_pw")
	public String editPw(Model model, @RequestParam String memberEmail) {
		model.addAttribute("memberDto", memberDao.selectOndId(memberEmail));
		return "member/edit_pw";
	}
	
	@PostMapping("/edit_pw")
	public String editPw(@ModelAttribute MemberDto memberDto) {
		memberDao.editPw(memberDto);
		return "redirect:edit_success";
	}
	
	@GetMapping("/mypage")
	public String mypage(Model model, HttpSession session) {
		String memberId = (String) session.getAttribute(SessionConstant.ID);
		if(memberId == null) {
			return "redirect:login";
		}
		
		model.addAttribute("nickAndEmail", memberDao.selectOndId(memberId));
		model.addAttribute("attachmentDto", attachmentDao.selectProfileImg(memberId));
		return "member/mypage";
	}
	
	@GetMapping("/edit_myinfo")
	public String editMyInfo(Model model, HttpSession session) {
		String memberId = (String) session.getAttribute(SessionConstant.ID);
		model.addAttribute("memberDto", memberDao.selectOndId(memberId));
		return "member/edit_myinfo";
	}
	
	@PostMapping("/edit_myinfo")
	public String editMyInfo(@ModelAttribute MemberDto inputDto, HttpSession session) {
		String memberId = (String) session.getAttribute(SessionConstant.ID);
		inputDto.setMemberEmail(memberId);
		boolean result = memberDao.editInfo(inputDto);
		System.out.println(result);
		System.out.println(inputDto);
		if(result) {
			return "redirect:mypage";
		}
		return null;
	}
}
