package com.example.bornedit.repository;

import java.util.List;

import com.example.bornedit.entity.MemberDto;
import com.example.bornedit.vo.HomeListTotalVO;

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
	
	// 마이페이지 로그인 상태에서 비밀번호 변경
	boolean loginEditPw(MemberDto memberDto);
	
	// 내가 쓴 글 & 카운트
	List<HomeListTotalVO> whatIWrote(String memberEmail);
	int howManyWhatIWrote(String memberEmail);
	
	// 내가 좋아요한 글 & 카운트
	List<HomeListTotalVO> whatIDoLike(String memberEmail);
	int howManyWhatIDoLike(String memberEmail);
	
	// 내가 댓글 단 글
	List<HomeListTotalVO> wroteComment(String memberEmail);
	int commentCount(String memberEmail);
	
	// 내가 저장한 글
	List<HomeListTotalVO> whatIDoSave(String memberEmail);
	int howManyWhatIDoSaveCount(String memberEmail);
	
}
