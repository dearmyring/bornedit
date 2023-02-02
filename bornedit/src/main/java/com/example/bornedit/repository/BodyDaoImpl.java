package com.example.bornedit.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.bornedit.entity.BodyDto;

@Repository
public class BodyDaoImpl implements BodyDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int sequence() {
		return sqlSession.selectOne("body.sequence");
	}
	
	@Override
	public void write(BodyDto bodyDto) {
		sqlSession.insert("body.write", bodyDto);
	}
	
	
}
