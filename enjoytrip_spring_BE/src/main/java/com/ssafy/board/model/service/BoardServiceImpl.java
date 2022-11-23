package com.ssafy.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.attraction.model.mapper.Attraction;
import com.ssafy.board.model.mapper.Board;
import com.ssafy.board.model.mapper.BoardMapper;
import com.ssafy.board.model.mapper.PlanInfo;

@Service
public class BoardServiceImpl implements BoardService {

	private BoardMapper boardMapper;

	@Autowired
	public BoardServiceImpl(BoardMapper boardMapper) {
		super();
		this.boardMapper = boardMapper;
	}

	@Override
	public List<Board> getList() throws Exception {
		return boardMapper.getList();
	}

	@Override
	public Board view(String planId) throws Exception {
		return boardMapper.view(planId);
	}

	@Override
	public void write(Board boardDto) throws Exception {
		boardMapper.writePlanBoard(boardDto);
		List<PlanInfo> planInfos = boardDto.getPlanInfos();
		if (planInfos != null && !planInfos.isEmpty()) {
			boardMapper.writePlanContent(boardDto);
		}
	}

	@Override
	public void modify(Board boardDto) throws Exception {
		boardMapper.modifyPlanBoard(boardDto);
		boardMapper.deletePlanContent(Integer.toString(boardDto.getPlanId()));
		List<PlanInfo> planInfos = boardDto.getPlanInfos();
		if (planInfos != null && !planInfos.isEmpty()) {
			boardMapper.writePlanContent(boardDto);
		}
	}

	@Override
	public void delete(String planId) throws Exception {
		boardMapper.delete(planId);
	}

	@Override
	public String getName(String planId) throws Exception {
		return boardMapper.getName(planId);
	}

	@Override
	public List<Attraction> getAttractions(String search) throws Exception {
		return boardMapper.getAttractions(search);
	}

	@Override
	public void writePlanBoard(Board boardDto) throws Exception {
		boardMapper.writePlanBoard(boardDto);
	}

	@Override
	public void updateHit(String planNo) throws Exception {
		boardMapper.updateHit(planNo);
	}

	@Override
	public void writePlanContent(Board boardDto) throws Exception {
//		for (int i = 0; i < contents.size(); i++) {
//			boardMapper.writePlanContent(contents.get(i));
//		}
	}

}
