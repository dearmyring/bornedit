package com.example.bornedit.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.bornedit.entity.BoardSaveDto;

@Repository
public class BoardSaveDaoImpl implements BoardSaveDao{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean check(BoardSaveDto boardSaveDto) {
		Integer result = sqlSession.selectOne("save.check", boardSaveDto);
		return result == null;
	}
	
	@Override
	public boolean delete(BoardSaveDto boardSaveDto) {
		int result = sqlSession.delete("save.delete", boardSaveDto);
		return result > 0;
	}
	
	@Override
	public boolean insert(BoardSaveDto boardSaveDto) {
		int result = sqlSession.insert("save.insert", boardSaveDto);
		return result > 0;
	}
	
}
