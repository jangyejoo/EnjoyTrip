package com.ssafy.board.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.board.model.mapper.Board;
import com.ssafy.board.model.mapper.PlanInfo;
import com.ssafy.board.model.service.BoardService;

@RestController
@RequestMapping("/board")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	private BoardService boardService;

	@Autowired
	public BoardController(BoardService boardService) {
		super();
		this.boardService = boardService;
	}
	
	// 일정 공유으로 페이지 변경
	@GetMapping("")
	public ModelAndView attraction() {
		logger.debug("일정 공유");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/list");
		return mv;
	}
	
	// 일정 조회
	@GetMapping("/list")
	public ResponseEntity<?> boardList(){
		logger.debug("boardList call");
		try {
			List<Board> boards = boardService.getList();
			if (boards != null && !boards.isEmpty()) {
				return new ResponseEntity<List<Board>>(boards, HttpStatus.OK);
			} else {
				return new ResponseEntity<List<Board>>(boards, HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return exceptionHandling(e);
		}
	}
	
	// 일정 상세 보기
	@GetMapping("/list/{planId}")
	public ResponseEntity<?> planView(@PathVariable("planId") String planId){
		logger.debug("planView call");
		try {
			Board board = boardService.view(planId);
			boardService.updateHit(planId);
			if (board != null) {
				return new ResponseEntity<Board>(board, HttpStatus.OK);
			} else {
				return new ResponseEntity<Board>(board, HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return exceptionHandling(e);
		}
	}
	
	// 일정 등록
	@PostMapping("/plan")
	public ResponseEntity<?> planRegister(@RequestBody Map<String, String> map){
		logger.debug("planRegister call");
//		HttpSession session = request.getSession();
//		User user = (User) session.getAttribute("userInfo");
//		if (user != null) {
			try {
				Board board = new Board();
				board.setTitle(map.get("title"));
				board.setThumbNail(map.get("thumbnail"));
				board.setUserId(map.get("userId"));
				List<PlanInfo> plans = new ArrayList<>();
				int i = 1;
				while(true) {
					String id = "attractionId" + i;
					String desc = "attractionDesc"+i;
					if (map.get(id) == null)
						break;
					PlanInfo plan = new PlanInfo();
					plan.setContentId(map.get(id));
					plan.setContentDesc(map.get(desc));
					plans.add(plan);
					i++;
				}
				board.setPlanInfos(plans);
				boardService.write(board);
				
				List<Board> boards = boardService.getList();
				if (boards != null && !boards.isEmpty()) {
					return new ResponseEntity<List<Board>>(boards, HttpStatus.OK);
				} else {
					return new ResponseEntity<List<Board>>(boards, HttpStatus.NO_CONTENT);
				}
			} catch (Exception e) {
				e.printStackTrace();
				return exceptionHandling(e);
			}
//		} else {
//			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
//		}
		
	}
	
	// 일정 수정
		@PutMapping("/plan")
		public ResponseEntity<?> planModify(@RequestBody Map<String, String> map){
			logger.debug("planModify call");
//			HttpSession session = request.getSession();
//			User user = (User) session.getAttribute("userInfo");
//			if (user != null) {
				try {
					Board board = new Board();
					board.setPlanId(Integer.parseInt(map.get("planId")));
					board.setTitle(map.get("title"));
					board.setThumbNail(map.get("thumbnail"));
					board.setUserId(map.get("userId"));
					List<PlanInfo> plans = new ArrayList<>();
					int i = 1;
					while(true) {
						String id = "attractionId" + i;
						String desc = "attractionDesc"+i;
						if (map.get(id) == null)
							break;
						PlanInfo plan = new PlanInfo();
						plan.setContentId(map.get(id));
						plan.setContentDesc(map.get(desc));
						plans.add(plan);
						i++;
					}
					board.setPlanInfos(plans);
					boardService.modify(board);
					
					List<Board> boards = boardService.getList();
					if (boards != null && !boards.isEmpty()) {
						return new ResponseEntity<List<Board>>(boards, HttpStatus.OK);
					} else {
						return new ResponseEntity<List<Board>>(boards, HttpStatus.NO_CONTENT);
					}
				} catch (Exception e) {
					e.printStackTrace();
					return exceptionHandling(e);
				}
//			} else {
//				return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
//			}
			
		}
	
	// 일정 삭제
	@DeleteMapping("/plan/{planId}")
	public ResponseEntity<?> planDelete(@PathVariable("planId") String planId){
		logger.debug("planDelete call");
		try {
			boardService.delete(planId);
			List<Board> boards = boardService.getList();
			if (boards != null && !boards.isEmpty()) {
				return new ResponseEntity<List<Board>>(boards, HttpStatus.OK);
			} else {
				return new ResponseEntity<List<Board>>(boards, HttpStatus.NO_CONTENT);
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
