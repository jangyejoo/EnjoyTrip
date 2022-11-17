package com.ssafy.attraction.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.attraction.model.mapper.Areacode;
import com.ssafy.attraction.model.mapper.Attraction;
import com.ssafy.attraction.model.mapper.AttractionMapper;
import com.ssafy.attraction.model.mapper.ContentTypeCode;
import com.ssafy.attraction.model.mapper.Sigungucode;

@Service
public class AttractionServiceImpl implements AttractionService {

	private AttractionMapper attractionMapper;
	
	@Autowired
	public AttractionServiceImpl(AttractionMapper attractionMapper) {
		super();
		this.attractionMapper = attractionMapper;
	}

	@Override
	public List<Areacode> getAreacode() throws Exception {
		return attractionMapper.getAreacode();
	}

	@Override
	public List<Sigungucode> getSigungucode(int regcode) throws Exception {
		return attractionMapper.getSigungucode(regcode);
	}

	@Override
	public List<Attraction> getAttractions(Map<String, String> param) throws Exception {
		return attractionMapper.getAttractions(param);
	}

	@Override
	public List<Attraction> getDefaultAttractions(Map<String, String> param) throws Exception {
		return attractionMapper.getDefaultAttractions(param);
	}

	@Override
	public List<Attraction> getAttractions(int areacode, int sigungucode, int optioncode) throws Exception {
		return attractionMapper.getAttractions(areacode, sigungucode, optioncode);
	}

	@Override
	public Attraction getAttraction(int contentid) throws Exception {
		return attractionMapper.getAttraction(contentid);
	}

	@Override
	public List<ContentTypeCode> getContentTypeCode() throws Exception {
		return attractionMapper.getContentTypeCode();
	}

	@Override
	public List<Attraction> getRandAttractions(Map<String, String> param) {
		 return attractionMapper.getRandAttractions(param);
	}

}
