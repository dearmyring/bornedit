package com.example.bornedit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.bornedit.repository.HomeDao;

@Controller
public class HomeController {
	
	@Autowired
	private HomeDao homeDao;

	@RequestMapping("/")
	public String home(Model model) {
		model.addAttribute("list", homeDao.list());
		return "home";
	}
	
	@RequestMapping("/popular")
	public String homePopular() {
		return "home-popular";
	}
}
