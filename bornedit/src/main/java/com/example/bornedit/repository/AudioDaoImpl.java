package com.example.bornedit.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.bornedit.entity.AudioDto;

@Repository
public class AudioDaoImpl implements AudioDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int sequence() {
		return sqlSession.selectOne("audio.sequence");
	}
	
	@Override
	public void write(AudioDto audioDto) {
		sqlSession.insert("audio.write", audioDto);
		
	}
}
