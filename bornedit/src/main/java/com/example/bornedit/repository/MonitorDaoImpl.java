package com.example.bornedit.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.bornedit.entity.MonitorDto;

@Repository
public class MonitorDaoImpl implements MonitorDao{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int sequence() {
		return sqlSession.selectOne("monitor.sequence");
	}
	
	@Override
	public void write(MonitorDto monitorDto) {
		sqlSession.insert("monitor.write", monitorDto);
	}
}
