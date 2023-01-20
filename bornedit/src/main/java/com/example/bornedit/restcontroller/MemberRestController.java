package com.example.bornedit.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.bornedit.entity.MemberDto;
import com.example.bornedit.repository.MemberDao;

@RestController
@RequestMapping("/rest/member")
public class MemberRestController {
	
	@Autowired
	private MemberDao memberDao;
	
	@GetMapping("/email/{memberEmail}")
	public String findId(@PathVariable String memberEmail) {
		MemberDto memberDto = memberDao.selectOndId(memberEmail);
		if(memberDto == null) {
			return "NNNNY";
		} else {
			return "NNNNN";
		}
	}
	
	@GetMapping("/nick/{memberNick}")
	public String findNick(@PathVariable String memberNick) {
		MemberDto memberDto = memberDao.selectOndNick(memberNick);
		if(memberDto == null) {
			return "NNNNY";
		} else {
			return "NNNNN";
		}
	}
	
}
