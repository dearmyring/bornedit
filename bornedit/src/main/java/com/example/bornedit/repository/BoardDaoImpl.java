package com.example.bornedit.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.bornedit.entity.BoardDto;

@Repository
public class BoardDaoImpl implements BoardDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int sequence() {
		return sqlSession.selectOne("board.sequence");
	}
	
	@Override
	public void write(BoardDto boardDto) {
		sqlSession.insert("board.write", boardDto);
	}
}
