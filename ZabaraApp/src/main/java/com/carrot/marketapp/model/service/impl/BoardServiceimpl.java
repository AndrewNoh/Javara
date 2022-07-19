package com.carrot.marketapp.model.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrot.marketapp.model.dao.BoardDAO;
import com.carrot.marketapp.model.dto.BoardDTO;
import com.carrot.marketapp.model.service.CommonService;

@Service("boardService")
public class BoardServiceimpl implements CommonService<BoardDTO>{
	
	@Autowired
	BoardDAO boardDAO;

	@Override
	public BoardDTO selectOne(Map map) {
		
		return boardDAO.selectOne(map);
	}

	@Override
	public int insert(Map map) {
		
		return boardDAO.insert(map);
	}

	@Override
	public int delete(Map map) {
		
		return boardDAO.delete(map);
	}

	@Override
	public int update(Map map) {
		
		return boardDAO.update(map);
	}

	@Override
	public String findNameByKey(Map map) {
		
		return null;
	}

	public List<BoardDTO> selectList(Map map) {
		
		return boardDAO.selectList(map);
	}

	public List<BoardDTO> selectListAll(Map map) {
		// TODO Auto-generated method stub
		return boardDAO.selectListAll(map);
	}

	public int insertImage(Map map) {
		return boardDAO.imageInsert(map);		
	}

	public int updateImage(Map map) {
		// TODO Auto-generated method stub
		return boardDAO.imageUpdate(map);
	}

	public int selectLike(Map map) {
		// TODO Auto-generated method stub
		return boardDAO.selectLike(map);
	}

	public int insertLike(Map map) {
		return boardDAO.insertLike(map);		
	}

	public int deleteLike(Map map) {
		return boardDAO.deleteLike(map);		
	}

	public List selectLikeList(Map map) {
		// TODO Auto-generated method stub
		return boardDAO.selectLikeList(map);
	}

	public int updateLike(Map map) {
		
		return boardDAO.updateLike(map);
		
	}

	public int selectLikeNo(Map map) {
		// TODO Auto-generated method stub
		return boardDAO.selectLikeNo(map);
	}

	public int updatePrice(Map map) {
		// TODO Auto-generated method stub
		return boardDAO.updatePrice(map);
	}

	public List<BoardDTO> mypageSelllist(Map map) {
		
		return boardDAO.mypageSelllist(map);
	}

	public int updateStatus(Map map) {
		return boardDAO.updateStatus(map);
		
	}
	

	
}
