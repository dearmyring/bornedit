package com.example.bornedit.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.bornedit.entity.ReplyDto;
import com.example.bornedit.vo.ReplyCountVO;
import com.example.bornedit.vo.ReplyVO;

@Repository
public class ReplyDaoImpl implements ReplyDao{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ReplyVO> selectReply(int boardNo) {
		return sqlSession.selectList("reply.selectOne", boardNo);
	}
	
	@Override
	public void write(ReplyDto replyDto) {
		sqlSession.insert("reply.write", replyDto);
	}
	
	@Override
	public ReplyCountVO count(int boardNo) {
		return sqlSession.selectOne("reply.count", boardNo);
	}
	
	@Override
	public boolean delete(int replyNo) {
		int count = sqlSession.delete("reply.delete", replyNo);
		return count > 0;
	}
}
