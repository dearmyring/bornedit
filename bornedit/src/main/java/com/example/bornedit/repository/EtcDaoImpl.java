package com.example.bornedit.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.bornedit.entity.EtcDto;

@Repository
public class EtcDaoImpl implements EtcDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int sequence() {
		return sqlSession.selectOne("etc.sequence");
	}
	
	@Override
	public void write(EtcDto etcDto) {
		sqlSession.insert("etc.write", etcDto);
	}
}
