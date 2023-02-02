package com.example.bornedit.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.bornedit.entity.LensDto;

@Repository
public class LensDaoImpl implements LensDao{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int sequence() {
		return sqlSession.selectOne("lens.sequence");
	}
	
	@Override
	public void write(LensDto lensDto) {
		sqlSession.insert("lens.write", lensDto);
	}
}
