package com.example.bornedit.repository;

import com.example.bornedit.entity.AttachmentDto;
import com.example.bornedit.entity.BoardVideoDto;
import com.example.bornedit.entity.ProfileImgDto;

public interface AttachmentDao {
	
	// 첨부파일 부모테이블 메서드
	int sequence();
	void uploadFile(AttachmentDto attachmentDto);
	AttachmentDto findFile(int attachmentNo);
	
	// 첨부파일 하위테이블(프로필이미지) 메서드
	void addProfileImg(ProfileImgDto profileDto);
	ProfileImgDto selectProfileImg(String memberEmail);
	boolean editProfileImg(ProfileImgDto profileDto);
	boolean deleteProfileImg(String memberEmail);
	
	// 첨부파일 하위테이블(비디오 업로드) 메서드
	void addVideo(BoardVideoDto boardVideoDto);
}
