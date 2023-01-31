package com.example.bornedit.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.bornedit.entity.CertificationDto;

@Repository
public class CertificationDaoImpl implements CertificationDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(CertificationDto certDto) {
		sqlSession.insert("certification.insert", certDto);
	}
	
	@Override
	public CertificationDto check(CertificationDto certDto) {
		return sqlSession.selectOne("certification.check", certDto);
	}
	
	@Override
	public void clear() {
		sqlSession.delete("certification.clear");
	}
	
	@Override
	public boolean delete(String certificationEmail) {
		int count = sqlSession.delete("certification.delete", certificationEmail);
		return count > 0;
	}
	
}
