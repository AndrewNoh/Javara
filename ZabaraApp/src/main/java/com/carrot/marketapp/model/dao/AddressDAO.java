package com.carrot.marketapp.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrot.marketapp.model.dto.AddressDTO;

@Repository("addressDAO")
public class AddressDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public AddressDTO selectOne(Map map) {
		return sqlSession.selectOne("getSimpleAddress", map);
	}

	public AddressDTO getwriteAddress(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getWriteAddress", map);
	}

	public List<AddressDTO> getHaveAddress(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("getHaveAddress", map);
	}

}