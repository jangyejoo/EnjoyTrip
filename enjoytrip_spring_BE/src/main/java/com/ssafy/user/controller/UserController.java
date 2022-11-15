package com.ssafy.user.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.resource.HttpResource;

import com.ssafy.user.model.mapper.User;
import com.ssafy.user.model.service.UserService;

@RestController
@RequestMapping("/user")
public class UserController {
	
	private static Logger logger = LoggerFactory.getLogger(UserController.class);
			
	private UserService userService;
	
	@Autowired
	public UserController(UserService userService) {
		this.userService = userService;
	}
	
	@PostMapping("/regist")
	public ResponseEntity<?> regist(@RequestBody User user) {
		logger.debug("regist로 진입함");
		logger.debug(user.toString());
		try {
			userService.regist(user);
		} catch (Exception e) {
			e.printStackTrace();
			return exceptionHandling(e);			
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	@PostMapping("/login")
	public ResponseEntity<?> login(@RequestBody Map<String, String> map, HttpSession session, HttpServletRequest request, HttpServletResponse response){
		logger.debug("login 진입");
		try {
			User curUser = userService.login(map);
			logger.debug(">>>> " + curUser);
			if(curUser == null) {
				logger.debug("헉!! 유저가 없다...!!");
				return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
			}else {
				session.setAttribute("userInfo", curUser);				
				return new ResponseEntity<Void>(HttpStatus.OK);
			}
			
//			logger.debug(">>>> " + curUser);
//			Cookie cookie = new Cookie("prevId", curUser.getUserId());
//			 if(map.get("saveId") == "1") {
//				cookie.setMaxAge(60*60*24*365*40);
//				cookie.setPath("/");
//				response.addCookie(cookie);
//			 }else {
//				 cookie.setMaxAge(0);
//			 }
			 
//			 Cookie cookie = new Cookie("ssafy_id", map.get("userid"));
//				cookie.setPath("/board");
//				if("ok".equals(map.get("saveid"))) {
//					cookie.setMaxAge(60*60*24*365*40);
//				} else {
//					cookie.setMaxAge(0);
//				}
//				response.addCookie(cookie);
			
		} catch (Exception e) {
			e.printStackTrace();
			return exceptionHandling(e);
		}
	}
	
	@PostMapping("/findpassword")
	public String findpassword(@RequestBody Map<String, String> map){
		try {
			String data = userService.find(map);
			if(data == null)
				return "올바른 정보가 아닙니다.";
			else
				return data;
		} catch (Exception e) {
			e.printStackTrace();
//			return "올바른 정보가 아닙니다.";
		}
		return "";
	}
	
	@PutMapping("/editProfile")
	public ResponseEntity<?> editProfile(@RequestBody Map<String, String> map, HttpSession session){
		logger.debug(map.toString());
		try {
			int isUser = userService.checkUser(map);
			if(isUser == 0) return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
			userService.editProfile(map);
			session.setAttribute("userInfo", userService.login(map));
		} catch (Exception e) {
			e.printStackTrace();
			return exceptionHandling(e);			
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	@DeleteMapping("/delete")
	public ResponseEntity<?> delete(@RequestBody User user, HttpSession session){
		logger.debug(user.toString());
		try {
			userService.delete(user.getUserId());
		} catch (Exception e) {
			e.printStackTrace();
			return exceptionHandling(e);			
		}
		session.invalidate();
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	@PostMapping("/idcheck")
	public Integer idcheck(@RequestBody User user) {
		try {
			int a = userService.idCheck(user.getUserId());
			logger.debug(">> " +a);
			return a;
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		}
	}
	
	private ResponseEntity<String> exceptionHandling(Exception e) {
		e.printStackTrace();
		return new ResponseEntity<String>("Error : " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
