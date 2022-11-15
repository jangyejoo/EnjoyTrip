package com.ssafy.user.model.mapper;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
	void regist(User userDto) throws SQLException;

	int idCheck(String userId) throws SQLException;

	User login(Map<String, String> map) throws SQLException;

	void editProfile(Map<String, String> map) throws SQLException;

	void delete(String userId) throws SQLException;

	String find(Map<String, String> map) throws SQLException;

	Integer checkUser(Map<String, String> map) throws SQLException;
}
