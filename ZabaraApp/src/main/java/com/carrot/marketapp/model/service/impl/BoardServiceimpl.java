package com.carrot.marketapp.model.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrot.marketapp.model.dao.BoardDAO;
import com.carrot.marketapp.model.dto.AddressDTO;
import com.carrot.marketapp.model.dto.BoardDTO;
import com.carrot.marketapp.model.service.CommonService;

@Service("boardService")
public class BoardServiceimpl implements CommonService<BoardDTO> {

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
		return boardDAO.selectListAll(map);
	}

	public int insertImage(Map map) {
		return boardDAO.imageInsert(map);
	}

	public int updateImage(Map map) {
		return boardDAO.imageUpdate(map);
	}

	public int selectLike(Map map) {
		return boardDAO.selectLike(map);
	}

	public int insertLike(Map map) {
		return boardDAO.insertLike(map);
	}

	public int deleteLike(Map map) {
		return boardDAO.deleteLike(map);
	}

	public List selectLikeList(Map map) {
		return boardDAO.selectLikeList(map);
	}

	public int updateLike(Map map) {
		return boardDAO.updateLike(map);

	}

	public int selectLikeNo(Map map) {
		return boardDAO.selectLikeNo(map);
	}

	public int updatePrice(Map map) {
		return boardDAO.updatePrice(map);
	}

	public List<BoardDTO> mypageSelllist(Map map) {
		return boardDAO.mypageSelllist(map);
	}

	public int updateStatus(Map map) {
		return boardDAO.updateStatus(map);
	}

	public List<BoardDTO> mypagelikelist(Map map) {
		return boardDAO.mypagelikelist(map);
	}

	public List<BoardDTO> searchProduct(Map map) {
		return boardDAO.searchProduct(map);
	}

	public List<BoardDTO> searchAuction(Map map) {
		return boardDAO.searchAuction(map);
	}

	public List<BoardDTO> searchGropBoard(Map map) {
		return boardDAO.searchGropBoard(map);

	}

	public int insertNewAddress(Map map) {
		return boardDAO.insertNewAddress(map);
	}

	public BoardDTO getWriteAuctionView(Map map) {
		return boardDAO.getWriteAuctionView(map);

	}

	public AddressDTO getUpdateAddress(Map map) {
		return boardDAO.getUpdateAddress(map);
	}

	public int UpdateAddress(Map map) {
		return boardDAO.updateAddress(map);
	}

	public List<BoardDTO> mainPageListNoAddr(Map map) {
		return boardDAO.mainPageListNoAddr(map);
	}

	public List<BoardDTO> mainPageListYesAddr(Map map) {
		return boardDAO.mainPageListYesAddr(map);
	}

	public List<BoardDTO> mypagepurchaselist(Map map) {
		return boardDAO.mypagepurchaselist(map);
	}
	
	public int getLikeCount(Map map) {
		return boardDAO.getLikeCount(map);
	}

	public int getSellCount(Map map) {
		return boardDAO.getSellCount(map);
	}

	public int getBuyCount(Map map) {
		return boardDAO.getBuyCount(map);
	}

	public int selectLiveLike(Map map) { // 좋아요 - 실시간 반영
		return boardDAO.selectLiveLike(map);
	}

	public List<BoardDTO> mypageaccountbook(Map map) {
		return boardDAO.mypageaccountbook(map);
	}
}
