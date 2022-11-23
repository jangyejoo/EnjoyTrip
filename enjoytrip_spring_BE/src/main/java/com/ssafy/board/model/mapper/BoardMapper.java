package com.ssafy.board.model.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.attraction.model.mapper.Attraction;

@Mapper
public interface BoardMapper {

	List<Board> getList() throws SQLException;

	Board view(String planId) throws SQLException;

	void write(Board boardDto) throws SQLException;

	void delete(String planId) throws SQLException;

	String getName(String planId) throws SQLException;

	List<Attraction> getAttractions(String search) throws SQLException;

	void writePlanBoard(Board boardDto) throws SQLException;

	void writePlanContent(Board boardDto) throws SQLException;

	void updateHit(String planNo) throws SQLException;

	void modifyPlanBoard(Board boardDto) throws SQLException;

	void deletePlanContent(String planId) throws SQLException;
}
