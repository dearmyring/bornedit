package com.example.bornedit.repository;

import java.util.List;

import com.example.bornedit.vo.HomeListTotalVO;
import com.example.bornedit.vo.SearchVO;

public interface HomeDao {
	List<HomeListTotalVO> list(SearchVO searchVO);
}
