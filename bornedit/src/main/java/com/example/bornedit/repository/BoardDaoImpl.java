package com.example.bornedit.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.bornedit.entity.BoardDto;
import com.example.bornedit.vo.BoardDetailVO;

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
	
	@Override
	public BoardDto selectOneBoard(int boardNo) {
		return sqlSession.selectOne("board.selectOneBoard",boardNo);
	}
	
	@Override
	public List<BoardDetailVO> detail(int boardNo) {
		return sqlSession.selectList("board.boardDetailMain", boardNo);
	}
}
