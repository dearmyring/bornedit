package com.example.bornedit.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.bornedit.repository.HomeDao;
import com.example.bornedit.vo.HomeListTotalVO;
import com.example.bornedit.vo.SearchVO;

@RestController
@RequestMapping("/rest")
public class HomeRestController {
	
	@Autowired
	private HomeDao homeDao;
	
	@PostMapping("/home/list")
	public List<HomeListTotalVO> list(@RequestBody SearchVO searchVO) {
		return homeDao.list(searchVO);
	}
	
	@PostMapping("/home/popular/list")
	public List<HomeListTotalVO> popularList(@RequestBody SearchVO seachVO) {
		return homeDao.popularList(seachVO);
	}
}
