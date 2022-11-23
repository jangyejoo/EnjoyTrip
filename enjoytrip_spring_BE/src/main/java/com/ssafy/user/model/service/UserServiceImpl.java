package com.ssafy.user.model.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.user.email.EmailService;
import com.ssafy.user.model.mapper.User;
import com.ssafy.user.model.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
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

	@Override
	public int nameCheck(String userName) throws Exception{
		return userMapper.nameCheck(userName);
	}
	
	@Override
	public void saveRefreshToken(String userId, String refreshToken) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("token", refreshToken);
		sqlSession.getMapper(UserMapper.class).saveRefreshToken(map);
	}

	@Override
	public User userInfo(String userId) throws Exception {
		return sqlSession.getMapper(UserMapper.class).userInfo(userId);
	}

	@Override
	public Object getRefreshToken(String userId) throws Exception  {
		return sqlSession.getMapper(UserMapper.class).getRefreshToken(userId);
	}

	@Override
	public void deleRefreshToken(String userid) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userid);
		map.put("token", null);
		System.out.println(map.toString());
		sqlSession.getMapper(UserMapper.class).deleteRefreshToken(map);
	}

	@Override
	public int modifyNameCheck(Map<String, String> map) throws Exception {
		return userMapper.modifyNameCheck(map);
	}

	@Override
	public void setNewPwd(Map<String, String> map) throws Exception {
		userMapper.setNewPwd(map);
	}

}
