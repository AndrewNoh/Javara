package com.carrot.marketapp.model.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrot.marketapp.model.dao.ReviewDAO;
import com.carrot.marketapp.model.dao.UserDAO;
import com.carrot.marketapp.model.dto.ReviewDTO;

@Service("review")
public class ReviewServiceimpl {
	
	@Autowired
	ReviewDAO reviewDAO;
	
	@Autowired
	UserDAO userDAO;

	public int mypagereviewInsert(Map map) {
		return reviewDAO.mypagereviewInsert(map);
	}

	public List<ReviewDTO> mypagereviewSelect(Map map) {
		return reviewDAO.mypagereviewSelect(map);
	}



	
}
