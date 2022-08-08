package com.carrot.marketapp.web.board;

import java.security.Principal;
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
	
	@Autowired
	UserServiceimpl userService;

	@Autowired
	CommentServiceimpl commentService;
	
	// 댓글 조회
	@PostMapping(value="/list.do")
	@ResponseBody
	public List<CommentDTO> list(@RequestParam Map map) throws JsonProcessingException {
		List<CommentDTO> commentList = commentService.commentSelectList(map);
		
		return commentList;
	}
	
	// 댓글 작성
	@PostMapping(value="/write.do", produces ="application/json;charset=UTF-8")
	@ResponseBody
	public int write(@RequestParam Map map, Principal principal) {
		map.put("email", principal.getName());
		UserDTO userinfo = userService.selectOne(map);
		map.put("comment_userno", userinfo.getUserno());
		// System.out.println(map.get("comment_userno")); // 유저번호
		// System.out.println(map.get("townlist_no")); // 글번호
		// System.out.println(map.get("comment_content")); // 글내용
			
		int newComment = commentService.commentInsert(map);
		System.out.println("newComment"+newComment);
			
		return newComment;
			
	}
	
	// 댓글 삭제
	@PostMapping(value="/delete.do")
	@ResponseBody
	public int delete(@RequestParam Map map) {
		commentService.commentDelete(map);
		
		return 0;
	}
	
	
	// 댓글 수정
	@PostMapping(value="/edit.do")
	@ResponseBody
	public int edit(@RequestParam Map map) {
		commentService.commentUpdate(map);
		
		return 0;
	}
	

}
