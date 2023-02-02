package com.example.bornedit.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.bornedit.entity.AttachmentDto;
import com.example.bornedit.entity.ProfileImgDto;

@Repository
public class AttachmentDaoImpl implements AttachmentDao{
	@Autowired
	private SqlSession sqlSession;
	
	// 첨부파일 부모테이블 메서드
	@Override
	public int sequence() {
		return sqlSession.selectOne("attachment.sequence");
	}
	
	@Override
	public void uploadFile(AttachmentDto attachmentDto) {
		sqlSession.insert("attachment.uploadFile", attachmentDto);
	}
	
	@Override
	public AttachmentDto findFile(int attachmentNo) {
		return sqlSession.selectOne("attachment.findFile", attachmentNo);
	}
	
	
	// 첨부파일 하위테이블(프로필이미지) 메서드
	@Override
	public void addProfileImg(ProfileImgDto profileDto) {
		sqlSession.insert("attachment.addProfileImg", profileDto);
	}
	
	@Override
	public ProfileImgDto selectProfileImg(String memberEmail) {
		return sqlSession.selectOne("attachment.selectProfileImg", memberEmail);
	}
	
	@Override
	public boolean editProfileImg(ProfileImgDto profileDto) {
		int result = sqlSession.update("attachment.editProfileImg", profileDto);
		return result > 0;
	}
	
	@Override
	public boolean deleteProfileImg(String memberEmail) {
		int result = sqlSession.delete("attachment.deleteProfileImg", memberEmail);
		return result > 0;
	}
}
