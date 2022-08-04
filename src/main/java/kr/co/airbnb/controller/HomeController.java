package kr.co.airbnb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.airbnb.service.AccommodationService;


@Controller
public class HomeController {

	@Autowired
	AccommodationService accommodationService;
	
	@GetMapping(path = "/")
	public String home() {
		return "home";
	}
	
	// 정수민 // 김유나 유나
	

	@GetMapping(path = "/list")
	public String list() {
		
		return "acc/list";
	}

}
