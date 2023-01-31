package com.example.bornedit.repository;

import com.example.bornedit.entity.MemberDto;

public interface MemberDao {
	// 비밀번호 암호화 & 회원가입
	void join(MemberDto memberDto);
	// 이메일 중복 검사 & 단일 조회
	MemberDto selectOndId(String memberEmail);
	// 닉네임 중복 검사
	MemberDto selectOndNick(String memberNick);
	// 로그인 시각 갱신
	boolean updateLoginTime(String memberEmail);
	// 비밀번호 변경
	boolean editPw(MemberDto memberDto);
	// 내 정보 변경
	boolean editInfo(MemberDto memberDto);
}
