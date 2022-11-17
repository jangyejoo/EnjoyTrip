package com.ssafy.attraction.model.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AttractionMapper {
	List<Areacode> getAreacode() throws SQLException;
	List<Sigungucode> getSigungucode(int regcode) throws SQLException;
	List<Attraction> getAttractions(Map<String, String> param) throws SQLException;
	List<Attraction> getDefaultAttractions(Map<String, String> param) throws SQLException;
	List<Attraction> getAttractions(int areacode, int sigungucode, int optioncode) throws SQLException;
	Attraction getAttraction(int contentid) throws SQLException;
	List<ContentTypeCode> getContentTypeCode();
	List<Attraction> getRandAttractions(Map<String, String> param);
}
