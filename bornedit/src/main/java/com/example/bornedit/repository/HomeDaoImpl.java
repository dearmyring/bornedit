package com.example.bornedit.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.bornedit.vo.HomeListTotalVO;
import com.example.bornedit.vo.SearchVO;

@Repository
public class HomeDaoImpl implements HomeDao{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<HomeListTotalVO> list(SearchVO searchVO) {
		return sqlSession.selectList("home.list", searchVO);
	}
	@Override
	public List<HomeListTotalVO> popularList(SearchVO searchVO) {
		return sqlSession.selectList("home.popularList", searchVO);
	}
}
