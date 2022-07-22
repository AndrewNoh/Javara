package com.carrot.marketapp.model.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrot.marketapp.model.dao.AddressDAO;
import com.carrot.marketapp.model.dto.AddressDTO;
import com.carrot.marketapp.model.service.CommonService;

@Service("addressService")
public class AddressServiceimpl implements CommonService<AddressDTO> {

	@Autowired
	AddressDAO addressDAO;

	@Override
	public AddressDTO selectOne(Map map) {

		return addressDAO.selectOne(map);
	}

	@Override
	public int insert(Map map) {
		return 0;
	}

	@Override
	public int delete(Map map) {
		return 0;
	}

	@Override
	public int update(Map map) {
		return 0;
	}

	@Override
	public String findNameByKey(Map map) {
		return null;
	}

	public AddressDTO getwriteAddress(Map map) {
		return addressDAO.getwriteAddress(map);
	}

	public List<AddressDTO> getHaveAddress(Map map) {
		return addressDAO.getHaveAddress(map);
	}

}
