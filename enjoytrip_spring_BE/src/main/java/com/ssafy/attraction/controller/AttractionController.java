package com.ssafy.attraction.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.attraction.model.mapper.Areacode;
import com.ssafy.attraction.model.mapper.Attraction;
import com.ssafy.attraction.model.mapper.ContentTypeCode;
import com.ssafy.attraction.model.mapper.Sigungucode;
import com.ssafy.attraction.model.service.AttractionService;

@RestController
@RequestMapping("/attraction")
public class AttractionController {

	private static final Logger logger = LoggerFactory.getLogger(AttractionController.class);

	private AttractionService attractionService;

	@Autowired
	public AttractionController(AttractionService attractionService) {
		super();
		this.attractionService = attractionService;
	}

	// 여행지 추천으로 페이지 변경
	@GetMapping("")
	public ModelAndView attraction() {
		logger.debug("여행지 추천");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("attraction/attraction-top30");
		return mv;
	}
	
	// 주변시설로 페이지 변경
	@GetMapping("/facilities")
	public ModelAndView facilities() {
		logger.debug("주변시설");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("attraction/nearby-facilities");
		return mv;
	}
	
	// 시도 조회
	@GetMapping("/sido")
	public ResponseEntity<?> sidoList() {
		logger.debug("sidoList call");
		try {
			List<Areacode> areas = attractionService.getAreacode();
			if (areas != null && !areas.isEmpty()) {
				return new ResponseEntity<List<Areacode>>(areas, HttpStatus.OK);
			} else {
				return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return exceptionHandling(e);
		}
	}

	// 군구 조회
	@GetMapping("/sido/{regcode}")
	public ResponseEntity<?> sigunguList(@PathVariable("regcode") int regcode) {
		logger.debug("sigunguList call");
		try {
			List<Sigungucode> sigungus = attractionService.getSigungucode(regcode);
			if (sigungus != null && !sigungus.isEmpty()) {
				return new ResponseEntity<List<Sigungucode>>(sigungus, HttpStatus.OK);
			} else {
				return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return exceptionHandling(e);
		}
	}

	// 지역별 관광지 조회
	@GetMapping("/list")
	public ResponseEntity<?> recommendList(@RequestParam("areaCode") String regcode,
			@RequestParam("gunguCode") String gungucode) {
		logger.debug("recommendList call");
		try {
			Map<String, String> param = new HashMap<>();
			param.put("regcode", regcode);
			param.put("gungucode", gungucode);
			List<Attraction> attractions = attractionService.getAttractions(param);
			if (attractions != null && !attractions.isEmpty()) {
				return new ResponseEntity<List<Attraction>>(attractions, HttpStatus.OK);
			} else {
				return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return exceptionHandling(e);
		}
	}

	// 위치정보기반 관광지 조회
	@GetMapping("/defaultlist")
	public ResponseEntity<?> defaultrecommendList(@RequestParam("lat") String lat,
			@RequestParam("lon") String lon) {
		logger.debug("defaultrecommendList call");
		try {
			Map<String, String> param = new HashMap<>();
			param.put("lat", lat);
			param.put("lon", lon);
			List<Attraction> attractions = attractionService.getDefaultAttractions(param);
			if (attractions != null && !attractions.isEmpty()) {
				return new ResponseEntity<List<Attraction>>(attractions, HttpStatus.OK);
			} else {
				return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return exceptionHandling(e);
		}
	}
	
	// 관광지 상세 정보
	@GetMapping("/detail/{contentId}")
	public ResponseEntity<?> contentView(@PathVariable("contentId") int contentId) {
		logger.debug("contentView call");
		try {
			Attraction attraction = attractionService.getAttraction(contentId);
			if (attraction != null) {
				return new ResponseEntity<Attraction>(attraction, HttpStatus.OK);
			} else {
				return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return exceptionHandling(e);
		}
	}
	
	// 주변 시설(숙박/이벤트) 조회
	@GetMapping("/facilities/list")
	public ResponseEntity<?> facilitiesList(@RequestParam("areaCode") String regcode,
			@RequestParam("gunguCode") String gungucode, @RequestParam("optionCode") String optioncode) {
		logger.debug("facilitiesList call");
		try {
			Map<String, String> param = new HashMap<>();
			param.put("regcode", regcode);
			param.put("gungucode", gungucode);
			param.put("optioncode", optioncode);
			List<Attraction> attractions = attractionService.getAttractions(param);
			if (attractions != null && !attractions.isEmpty()) {
				return new ResponseEntity<List<Attraction>>(attractions, HttpStatus.OK);
			} else {
				return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return exceptionHandling(e);
		}
	}
	
	// 검색어로 조회
	@GetMapping("/search")
	public ResponseEntity<?> searchList(@RequestParam("key") String key) {
		logger.debug("searchList call");
		try {
			Map<String, String> param = new HashMap<>();
			param.put("search", key);
			List<Attraction> attractions = attractionService.getAttractions(param);
			if (attractions != null && !attractions.isEmpty()) {
				return new ResponseEntity<List<Attraction>>(attractions, HttpStatus.OK);
			} else {
				return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return exceptionHandling(e);
		}
	}
	
	// 관광지 타입 조회
	@GetMapping("/contenttpye")
	public ResponseEntity<?> contentTypeList() {
		logger.debug("contentTypeList call");
		try {
			List<ContentTypeCode> areas = attractionService.getContentTypeCode();
			if (areas != null && !areas.isEmpty()) {
				return new ResponseEntity<List<ContentTypeCode>>(areas, HttpStatus.OK);
			} else {
				return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return exceptionHandling(e);
		}
	}
	
	@GetMapping("/randlist")
	public ResponseEntity<?> randList(@RequestParam("areaCode") String regcode,
			@RequestParam("gunguCode") String gungucode) {
		logger.debug("RandList call");
		try {
			Map<String, String> param = new HashMap<>();
			param.put("regcode", regcode);
			param.put("gungucode", gungucode);
			List<Attraction> attractions = attractionService.getRandAttractions(param);
			if (attractions != null && !attractions.isEmpty()) {
				return new ResponseEntity<List<Attraction>>(attractions, HttpStatus.OK);
			} else {
				return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return exceptionHandling(e);
		}
	}
	
	private ResponseEntity<String> exceptionHandling(Exception e) {
		e.printStackTrace();
		return new ResponseEntity<String>("Error : " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	}

}
