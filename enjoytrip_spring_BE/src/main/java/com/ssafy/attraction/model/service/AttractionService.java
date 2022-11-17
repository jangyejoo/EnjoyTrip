package com.ssafy.attraction.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.attraction.model.mapper.Areacode;
import com.ssafy.attraction.model.mapper.Attraction;
import com.ssafy.attraction.model.mapper.Sigungucode;
import com.ssafy.attraction.model.mapper.ContentTypeCode;

public interface AttractionService {
	List<Areacode> getAreacode() throws Exception;

	List<Sigungucode> getSigungucode(int regcode) throws Exception;

	List<Attraction> getAttractions(Map<String, String> param) throws Exception;

	List<Attraction> getDefaultAttractions(Map<String, String> param) throws Exception;

	List<Attraction> getAttractions(int areacode, int sigungucode, int optioncode) throws Exception;

	Attraction getAttraction(int contentid) throws Exception;
	
	List<ContentTypeCode> getContentTypeCode() throws Exception;

	List<Attraction> getRandAttractions(Map<String, String> param);
}
