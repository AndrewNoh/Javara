package com.carrot.marketapp.model.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrot.marketapp.model.dao.ImageDAO;
import com.carrot.marketapp.model.dto.ImageDTO;
import com.carrot.marketapp.model.service.CommonService;

@Service("imageService")
public class ImageServiceimpl implements CommonService<ImageDTO>{
	
	@Autowired
	ImageDAO imageDAO;

	@Override
	public ImageDTO selectOne(Map map) {
		
		return null;
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

	public List<ImageDTO> selectList(Map map) {
		// TODO Auto-generated method stub
		return imageDAO.selectList(map);
	}

}
