package com.carrot.marketapp.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrot.marketapp.model.dto.ImageDTO;

@Repository("imageDAO")
public class ImageDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<ImageDTO> selectList(Map map) {
		if(map.get("board").equals("우리동네")) {		
			return sqlSession.selectList("getTownImage", map);
		} else {			
			return sqlSession.selectList("getAuctionImage", map);
		}
		
	}

}
