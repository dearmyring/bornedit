package com.example.bornedit.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.bornedit.entity.RightDto;

@Repository
public class RightDaoImpl implements RightDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int sequence() {
		return sqlSession.selectOne("right.sequence");
	}
	
	@Override
	public void write(RightDto rightDto) {
		sqlSession.insert("right.write", rightDto);
	}
	
}
