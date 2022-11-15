package com.ssafy.user.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.user.model.mapper.User;
import com.ssafy.user.model.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	private UserMapper userMapper;

	@Autowired
	public UserServiceImpl(UserMapper userMapper) {
		super();
		this.userMapper = userMapper;
	}

	@Override
	public void regist(User userDto) throws Exception {
		userMapper.regist(userDto);
	}

	@Override
	public int idCheck(String userId) throws Exception {
		return userMapper.idCheck(userId);
	}

	@Override
	public User login(Map<String, String> map) throws Exception {
		return userMapper.login(map);
	}

	@Override
	public void editProfile(Map<String, String> map) throws Exception {
		userMapper.editProfile(map);
	}

	@Override
	public void delete(String userId) throws Exception {
		userMapper.delete(userId);
	}

	@Override
	public String find(Map<String, String> map) throws Exception {
		return userMapper.find(map);
	}

	@Override
	public Integer checkUser(Map<String, String> map) throws Exception {
		return userMapper.checkUser(map);
	}

}
