package com.carrot.marketapp.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrot.marketapp.model.dto.ReviewDTO;

@Repository("reviewDAO")
public class ReviewDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int mypagereviewInsert(Map map) {
		
		return sqlSession.insert("mypagereviewInsert", map);

	}

	public List<ReviewDTO> mypagereviewSelect(Map map) {
		return sqlSession.selectList("mypagereviewSelect", map);
	}

	

	
	





}
