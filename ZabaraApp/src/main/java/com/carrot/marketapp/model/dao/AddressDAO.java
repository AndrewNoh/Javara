package com.carrot.marketapp.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrot.marketapp.model.dto.AddressDTO;
import com.carrot.marketapp.model.dto.UserDTO;

@Repository("addressDAO")
public class AddressDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public AddressDTO selectOne(Map map) {
		return sqlSession.selectOne("getSimpleAddress", map);
	}

	
}