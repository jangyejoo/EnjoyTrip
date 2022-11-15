package com.ssafy.main.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

//	@GetMapping("/")
//	public String index() {
//		logger.debug("메인 페이지");
//		return "main";
//	}

//	@GetMapping("/attraction")
//	public String attraction() {
//		logger.debug("여행지 추천");
//		return "attraction/attraction-top30";
//	}
	
//	@GetMapping("/facilities")
//	public String facilities() {
//		logger.debug("주변시설");
//		return "attraction/nearby-facilities";
//	}
	
	@GetMapping("/regist")
	public String mvregist() {
		logger.debug("회원 가입으로 이동");
		return "user/register";
	}
	
	@GetMapping("/login")
	public String mvlogin() {
		logger.debug("로그인으로 이동");
		return "user/login";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		logger.debug("로그아웃");
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/infoprofile")
	public String infoprofile() {
		logger.debug("마이페이지");
		return "user/info-profile";
	}
	
	@GetMapping("/editprofile")
	public String editprofile() {
		logger.debug("회원정보 수정");
		return "user/edit-profile";
	}
	
}
