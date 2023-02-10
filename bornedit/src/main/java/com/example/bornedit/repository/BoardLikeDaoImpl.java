package com.example.bornedit.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.bornedit.entity.BoardLikeDto;
import com.example.bornedit.vo.LikeCountVO;

@Repository
public class BoardLikeDaoImpl implements BoardLikeDao{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean check(BoardLikeDto boardLikeDto) {
		Integer result = sqlSession.selectOne("like.check", boardLikeDto);
		return result == null;
	}
	
	@Override
	public boolean delete(BoardLikeDto boardLikeDto) {
		int result = sqlSession.delete("like.delete", boardLikeDto);
		return result > 0;
	}
	
	@Override
	public boolean insert(BoardLikeDto boardLikeDto) {
		int result = sqlSession.insert("like.insert", boardLikeDto);
		return result > 0;
	}
	
	@Override
	public LikeCountVO likeCount(int boardNo) {
		return sqlSession.selectOne("like.likeCount", boardNo);
	}
}
