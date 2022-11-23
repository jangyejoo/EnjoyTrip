package com.ssafy.user.controller;

import java.util.HashMap;
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
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.resource.HttpResource;

import com.ssafy.user.email.EmailService;
import com.ssafy.user.model.mapper.User;
import com.ssafy.user.model.service.UserService;
import com.ssafy.user.model.service.JwtServiceImpl;

@RestController
@RequestMapping("/user")
//@Api('userContoller api')
public class UserController {
	
	private static Logger logger = LoggerFactory.getLogger(UserController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";
	
	@Autowired
	private JwtServiceImpl jwtService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private EmailService javaMailSender;
	
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
//	public ResponseEntity<?> login(@RequestBody Map<String, String> map, HttpSession session, HttpServletRequest request, HttpServletResponse response){
	public ResponseEntity<?> login(@RequestBody Map<String, String> map){
		logger.debug("login 진입");
		Map<String, Object> resultMap = new HashMap<>();
		HttpStatus status = null;
		try {
			User loginUser = userService.login(map);
			logger.debug(">>>> " + loginUser);
			if(loginUser == null) {
				logger.debug("헉!! 유저가 없다...!!");
				resultMap.put("message", FAIL);
				status = HttpStatus.ACCEPTED;
//				return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
			}else {
//				session.setAttribute("userInfo", curUser);
				String accessToken = jwtService.createAccessToken("userid", loginUser.getUserId());// key, data
				String refreshToken = jwtService.createRefreshToken("userid", loginUser.getUserId());// key, data
				userService.saveRefreshToken(loginUser.getUserId(), refreshToken);
				resultMap.put("access-token", accessToken);
				resultMap.put("refresh-token", refreshToken);
				resultMap.put("message", SUCCESS);
				status = HttpStatus.ACCEPTED;
//				return new ResponseEntity<User>(loginUser, HttpStatus.OK);
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
//			e.printStackTrace();
			logger.error("로그인 실패 : {}", e);
			resultMap.put("message", e.getMessage());
			status = HttpStatus.INTERNAL_SERVER_ERROR;
//			return exceptionHandling(e);
		}
		return new ResponseEntity<Map<String, Object>>(resultMap, status);
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
	public ResponseEntity<?> editProfile(@RequestBody Map<String, String> map){
		
		logger.debug(map.toString());
		try {
//			int isUser = userService.checkUser(map);
//			if(isUser == 0) return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
			userService.editProfile(map);
//			session.setAttribute("userInfo", userService.login(map));
		} catch (Exception e) {
			e.printStackTrace();
			return exceptionHandling(e);			
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	@DeleteMapping("/delete")
	public ResponseEntity<?> delete(@RequestBody User user){
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		logger.debug(user.toString());
		try {
			userService.delete(user.getUserId());
		} catch (Exception e) {
			e.printStackTrace();
			return exceptionHandling(e);			
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	@PostMapping("/idcheck")
	public Integer idcheck(@RequestBody User user) {
		logger.debug("idcheck");
		logger.debug(user.toString());
		try {
			int a = userService.idCheck(user.getUserId());
			logger.debug(">> " +a);
			return a;
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		}
	}
	
	@PostMapping("/namecheck")
	public Integer namecheck(@RequestBody User user) {
		logger.debug("idcheck");
		logger.debug(user.toString());
		try {
			int a = userService.nameCheck(user.getUserName());
			logger.debug(">> " +a);
			return a;
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		}
	}
	@PostMapping("/modifynamecheck")
	public Integer modifynamecheck(@RequestBody Map<String, String> map) {
		logger.debug("idcheck");
//		logger.debug(user.toString());
		try {
			int a = userService.modifyNameCheck(map);
			logger.debug(">> " +a);
			return a;
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		}
	}
	
	@GetMapping("/info/{userid}")
	public ResponseEntity<Map<String, Object>> getInfo(
			@PathVariable("userid") String userId,
			HttpServletRequest request) {
		logger.debug("userid : {} ", userId);
		Map<String, Object> resultMap = new HashMap<>();
		HttpStatus status = HttpStatus.UNAUTHORIZED;
		if (jwtService.checkToken(request.getHeader("access-token"))) {
			logger.info("사용 가능한 토큰!!!");
			try {
//				로그인 사용자 정보.
				User user = userService.userInfo(userId);
				resultMap.put("userInfo", user);
				resultMap.put("message", SUCCESS);
				status = HttpStatus.ACCEPTED;
			} catch (Exception e) {
				logger.error("정보조회 실패 : {}", e);
				resultMap.put("message", e.getMessage());
				status = HttpStatus.INTERNAL_SERVER_ERROR;
			}
		} else {
			logger.error("사용 불가능 토큰!!!");
			resultMap.put("message", FAIL);
			status = HttpStatus.UNAUTHORIZED;
		}
		return new ResponseEntity<Map<String, Object>>(resultMap, status);
	}
	
	@PostMapping("/refresh")
	public ResponseEntity<?> refreshToken(@RequestBody User user, HttpServletRequest request)
			throws Exception {
		Map<String, Object> resultMap = new HashMap<>();
		HttpStatus status = HttpStatus.ACCEPTED;
		String token = request.getHeader("refresh-token");
		logger.debug("token : {}, memberDto : {}", token, user);
		if (jwtService.checkToken(token)) {
			if (token.equals(userService.getRefreshToken(user.getUserId()))) {
				String accessToken = jwtService.createAccessToken("userid", user.getUserId());
				logger.debug("token : {}", accessToken);
				logger.debug("정상적으로 액세스토큰 재발급!!!");
				resultMap.put("access-token", accessToken);
				resultMap.put("message", SUCCESS);
				status = HttpStatus.ACCEPTED;
			}
		} else {
			logger.debug("리프레쉬토큰도 사용불!!!!!!!");
			status = HttpStatus.UNAUTHORIZED;
		}
		return new ResponseEntity<Map<String, Object>>(resultMap, status);
	}
	
	@GetMapping("/logout/{userid}")
	public ResponseEntity<?> removeToken(@PathVariable("userid") String userid) {
		Map<String, Object> resultMap = new HashMap<>();
		HttpStatus status = HttpStatus.ACCEPTED;
		try {
			userService.deleRefreshToken(userid);
			resultMap.put("message", SUCCESS);
			status = HttpStatus.ACCEPTED;
		} catch (Exception e) {
			logger.error("로그아웃 실패 : {}", e);
			resultMap.put("message", e.getMessage());
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<Map<String, Object>>(resultMap, status);

	}
	
	@PostMapping("/findpwd")
	public ResponseEntity<?> findPwd( @RequestBody Map<String, String> map) {
		String target = map.get("userId");
		Map<String, Object> resultMap = new HashMap<>();
		HttpStatus status = HttpStatus.ACCEPTED;
		logger.debug("find pwd: target user >>>> {}", target);
		
		try {
			String userName = userService.userInfo(target).getUserName();
			String newPass = javaMailSender.sendMail(target, userName);
			System.out.println("passmail");
			Map<String, String> newInfo = new HashMap<String, String>();
			newInfo.put("userId", target);
			newInfo.put("newPwd", newPass);
			resultMap.put("message", SUCCESS);
			status = HttpStatus.ACCEPTED;
			userService.setNewPwd(newInfo);
		} catch (Exception e) {
			logger.error("비밀번호 변경 실패 : {}", e);
			resultMap.put("message", e.getMessage());
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<Map<String, Object>>(resultMap, status);
	}
	
	private ResponseEntity<String> exceptionHandling(Exception e) {
		e.printStackTrace();
		return new ResponseEntity<String>("Error : " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
