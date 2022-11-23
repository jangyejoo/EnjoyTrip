package com.ssafy.board.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.attraction.model.mapper.Attraction;
import com.ssafy.board.model.mapper.Board;

public interface BoardService {
	List<Board> getList() throws Exception;

	Board view(String planId) throws Exception;

	void write(Board boardDto) throws Exception;

	void delete(String planId) throws Exception;

	String getName(String planId) throws Exception;

	List<Attraction> getAttractions(String search) throws Exception;

	void writePlanBoard(Board boardDto) throws Exception;

	void writePlanContent(Board boardDto) throws Exception;

	void updateHit(String planId) throws Exception;

	void modify(Board boardDto) throws Exception;
}
