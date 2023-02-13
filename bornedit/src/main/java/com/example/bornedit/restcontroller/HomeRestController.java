package com.example.bornedit.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.bornedit.repository.HomeDao;
import com.example.bornedit.vo.HomeListTotalVO;

@RestController
@RequestMapping("/rest")
public class HomeRestController {
	
	@Autowired
	private HomeDao homeDao;
	
	@GetMapping("/home/list")
	public List<HomeListTotalVO> list () {
		return homeDao.list();
	}
}
