package com.example.bornedit.repository;

import com.example.bornedit.entity.MemberDto;

public interface MemberDao {
	// 비밀번호 암호화 & 회원가입
	void join(MemberDto memberDto);
	// 이메일 중복 검사
	MemberDto selectOndId(String memberEmail);
	// 닉네임 중복 검사
	MemberDto selectOndNick(String memberNick);
}
