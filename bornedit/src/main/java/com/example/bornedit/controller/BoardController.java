package com.example.bornedit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.bornedit.repository.BoardDao;

@Controller
@RequestMapping("/board")

public class BoardController {

	@Autowired
	private BoardDao boardDao;
	
	@GetMapping("/write")
	public String write() {
		return "board/write";
	}
	
//	@PostMapping("/write")
//	public String write() {
//		
//	}
}
