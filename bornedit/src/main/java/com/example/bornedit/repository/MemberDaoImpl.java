package com.example.bornedit.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.example.bornedit.entity.MemberDto;
import com.example.bornedit.vo.HomeListTotalVO;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private PasswordEncoder encoder;
	
	// 비밀번호 암호화 & 회원가입
	@Override
	public void join(MemberDto memberDto) {
		String memberPw = memberDto.getMemberPw();
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
	
	// 로그인 시각 갱신
	@Override
	public boolean updateLoginTime(String memberEmail) {
		int result = sqlSession.update("member.updateLoginTime", memberEmail);
		return result > 0;
	}
	
	@Override
	public boolean editPw(MemberDto memberDto) {
		String memberPw = memberDto.getMemberPw();
		String enc = encoder.encode(memberPw);
		memberDto.setMemberPw(enc);
		int result = sqlSession.update("member.editPw", memberDto);
		return result > 0;
	}
	
	@Override
	public boolean editInfo(MemberDto memberDto) {
		int count = sqlSession.update("member.editInfo", memberDto);
		return count > 0;
	}
	
	@Override
	public boolean loginEditPw(MemberDto memberDto) {
		String memberPw = memberDto.getMemberPw();
		String enc2 = encoder.encode(memberPw);
		memberDto.setMemberPw(enc2);
		int result = sqlSession.update("member.loginEditPw", memberDto);
		return result > 0;
	}
	
	@Override
	public List<HomeListTotalVO> whatIWrote(String memberEmail) {
		return sqlSession.selectList("member.whatIWroteByEmail",memberEmail);
	}
	
	@Override
	public int howManyWhatIWrote(String memberEmail) {
		int result = sqlSession.selectOne("member.howManyWhatIWrote", memberEmail);
		return result;
	}
	
	@Override
	public List<HomeListTotalVO> whatIDoLike(String memberEmail) {
		return sqlSession.selectList("member.whatIDoLike", memberEmail);
	}
	
	@Override
	public int howManyWhatIDoLike(String memberEmail) {
		int result = sqlSession.selectOne("member.howManyWhatIDoLike", memberEmail);
		return result;
	}
	
	@Override
	public List<HomeListTotalVO> wroteComment(String memberEmail) {
		return sqlSession.selectList("member.wroteComment", memberEmail);
	}
	
	@Override
	public int commentCount(String memberEmail) {
		int result = sqlSession.selectOne("member.commentCount", memberEmail);
		return result;
	}
	
	@Override
	public List<HomeListTotalVO> whatIDoSave(String memberEmail) {
		return sqlSession.selectList("member.whatIDoSave", memberEmail);
	}
	
	@Override
	public int howManyWhatIDoSaveCount(String memberEmail) {
		int result = sqlSession.selectOne("member.howManyWhatIDoSaveCount", memberEmail);
		return result;
	}
}
