package com.carrot.marketapp.web.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carrot.marketapp.model.dto.CommentDTO;
import com.carrot.marketapp.model.dto.UserDTO;
import com.carrot.marketapp.model.service.impl.CommentServiceimpl;
import com.carrot.marketapp.model.service.impl.UserServiceimpl;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping("/comment")
public class CommentController {
	// div selector // div content 날리기(jquery)
	// ajax 반복하여 데이터 뿌려주기 
	// ajax success/done(javascript for문 이용) // append
	// 댓글 작성 후 불러오는 ajax 재실행 
	// ajax 함수로 빼는 것이 *tip*
	
	@Autowired
	UserServiceimpl userService;

	@Autowired
	CommentServiceimpl commentService;
	
	// 댓글 조회
	@PostMapping(value="list.do", produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public List<CommentDTO> list(@RequestParam Map map) throws JsonProcessingException {
		List<CommentDTO> commentList = commentService.commentSelectList(map);
		
		return commentList;
	}
	
	// 댓글 작성
	@PostMapping(value="write.do")
	@ResponseBody
	public int write(Authentication auth, @RequestParam Map map) {
		UserDTO userinfo = userService.selectOne(map);
		map.put("userno", userinfo.getUserno());
		
		int newComment = commentService.commentInsert(map);
		map.put("comment_no", newComment);
			
		
		return 0;
		
	}

	// 댓글 삭제
	@PostMapping(value="delete.do")
	@ResponseBody
	public int delete(@RequestParam Map map) {
		commentService.commentDelete(map);
		
		return 0;
	}
	
	
	// 댓글 수정
	@PostMapping(value="edit.do")
	@ResponseBody
	public int edit(@RequestParam Map map) {
		commentService.commentUpdate(map);
		
		return 0;
	}
	

}
