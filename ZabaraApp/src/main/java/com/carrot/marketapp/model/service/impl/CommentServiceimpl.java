package com.carrot.marketapp.model.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrot.marketapp.model.dao.CommentDAO;
import com.carrot.marketapp.model.dto.CommentDTO;

@Service("commentService")
public class CommentServiceimpl {

	@Autowired
	CommentDAO commentDao;
	
	public int commentInsert(Map map) {
		return commentDao.commentInsert(map);
	}
	
	public List<CommentDTO> commentSelectList(Map map) {
		return commentDao.commentSelectList(map);
	}
	
	public int commentUpdate(Map map) {
		return commentDao.commentUpdate(map);
	}
	
	public int commentDelete(Map map) {
		return commentDao.commentDelete(map);
	}
}
