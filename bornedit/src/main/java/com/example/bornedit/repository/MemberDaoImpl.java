package com.example.bornedit.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.example.bornedit.entity.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private PasswordEncoder encoder;
	
	// 비밀번호 암호화 & 회원가입
	@Override
	public void join(MemberDto memberDto) {
		String memberPw = memberDto.getMemberNick();
		String enc = encoder.encode(memberPw);
		memberDto.setMemberPw(enc);
		sqlSession.insert("member.join", memberDto);
	}
	
	// 이메일 중복 검사
	@Override
	public MemberDto selectOndId(String memberEmail) {
		return sqlSession.selectOne("member.getEmail", memberEmail);
	}
	
	// 닉네임 중복 검사
	@Override
	public MemberDto selectOndNick(String memberNick) {
		return sqlSession.selectOne("member.getNick", memberNick);
	}
}
