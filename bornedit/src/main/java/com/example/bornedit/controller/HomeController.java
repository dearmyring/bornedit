package com.example.bornedit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HomeController {
	

	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/popular")
	public String homePopular() {
		return "home-popular";
	}
	
}
