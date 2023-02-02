package com.example.bornedit.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.bornedit.entity.TripodDto;

@Repository
public class TripodDaoImpl implements TripodDao{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int sequence() {
		return sqlSession.selectOne("tripod.sequence");
	}
	
	@Override
	public void write(TripodDto tripodDto) {
		sqlSession.insert("tripod.write", tripodDto);
	}
}
