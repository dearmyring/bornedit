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
	public boolean delete(int boardNo) {
		int result = sqlSession.delete("board.delete", boardNo);
		return result > 0;
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
	
	@Override
	public boolean incrementViewCount(int boardNo) {
		int result = sqlSession.update("board.incrementViewCount", boardNo);
		return result > 0;
	}
	
	@Override
	public boolean decrementLikeCount(int boardNo) {
		int result = sqlSession.update("board.decrementLikeCount", boardNo);
		return result > 0;
	}
	
	@Override
	public boolean incrementLikeCount(int boardNo) {
		int result = sqlSession.update("board.incrementLikeCount", boardNo);
		return result > 0;
	}
	
	@Override
	public boolean decrementSaveCount(int boardNo) {
		int result = sqlSession.update("board.decrementSaveCount", boardNo);
		return result > 0;
	}
	
	@Override
	public boolean incrementSaveCount(int boardNo) {
		int result = sqlSession.update("board.incrementSaveCount", boardNo);
		return result > 0;
	}
}
