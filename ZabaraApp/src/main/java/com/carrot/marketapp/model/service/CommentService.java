package com.carrot.marketapp.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.carrot.marketapp.model.dao.CommentDAO;
import com.carrot.marketapp.model.dto.CommentDTO;

public class CommentService {

	@Autowired
	CommentDAO commentDAO;
	
	public int commentInsert(Map map) { return commentDAO.commentInsert(map); }
	
	public List<CommentDTO> commentSelectList(Map map) { return commentDAO.commentSelectList(map); }
	
	public int commentUpdate(Map map) { return commentDAO.commentUpdate(map); }
	
	public int commentDelete(Map map) { return commentDAO.commentDelete(map); }
}
