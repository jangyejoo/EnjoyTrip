package com.ssafy.user.model.service;

import java.sql.SQLException;
import java.util.Map;

import com.ssafy.user.model.mapper.User;

public interface UserService {
	void regist(User userDto) throws Exception;

	int idCheck(String userId) throws Exception;

	User login(Map<String, String> map) throws Exception;

	void editProfile(Map<String, String> map) throws Exception;

	void delete(String userId) throws Exception;

	String find(Map<String, String> map) throws Exception;
	
	Integer checkUser(Map<String, String> map) throws Exception;

	int nameCheck(String userId);
}
