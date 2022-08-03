package com.carrot.marketapp.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrot.marketapp.model.dto.AddressDTO;
import com.carrot.marketapp.model.dto.BoardDTO;

@Repository("boardDAO")
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<BoardDTO> selectList(Map map) {
		if (map.get("board").equals("우리동네")) {
			return sqlSession.selectList("getGropList", map);
		} else {
			return sqlSession.selectList("getAuctionList", map);
		}

	}

	public BoardDTO selectOne(Map map) {
		if (map.get("board").equals("우리동네")) {
			return sqlSession.selectOne("getListOne", map);
		} else {
			return sqlSession.selectOne("getAuctionListOne", map);
		}

	}

	public int insert(Map map) {
		if (map.get("board").equals("우리동네")) {
			return sqlSession.insert("insertBoard", map);
		} else {
			sqlSession.insert("writeAuctionList", map);
			return sqlSession.insert("writeAuctionPrice", map);
		}
	}

	public int imageInsert(Map map) {
		if (map.get("board").equals("우리동네")) {
			int townNo = sqlSession.selectOne("getGropNo");
			map.put("townNo", townNo);
			return sqlSession.insert("insertTownListImage", map);

		} else {
			if(map.get("auction_no") == null) {
				int auctionNo = sqlSession.selectOne("getAuctionNo");
				map.put("auction_no", auctionNo);
			}
			
			return sqlSession.insert("insertAuctionImage", map);

		}

	}

	public List<BoardDTO> selectListAll(Map map) {
		if (map.get("board").equals("우리동네")) {
			return sqlSession.selectList("getGropListAll", map);
		}else if(map.get("board").equals("동네아이템가져오기")) {
			return sqlSession.selectList("getAuctionListAddressItems",map);
		} else {
			return sqlSession.selectList("getAuctionListAll", map);
		}
	}

	public int delete(Map map) {
		if (Integer.parseInt((String) map.get("townlist_no")) != 0) {
			sqlSession.delete("deleteGropImg", map);
			return sqlSession.delete("deleteBoard", map);
		} else {
			sqlSession.delete("deleteAuctionImg", map);
			sqlSession.delete("deleteAuctionPrice", map);
			sqlSession.delete("deleteAuctionLikeNo", map);
			return sqlSession.delete("deleteAuction", map);
		}

	}

	public int update(Map map) {
		if (map.get("board").equals("우리동네")) {
			int aff = 1;
			if(map.get("profile") != null) {
				aff = sqlSession.delete("deleteGropImg", map);
			}			

			sqlSession.delete("deleteTownLikeNo", map);

			if (aff == 1) {
				return sqlSession.update("updateBoard", map);
			}

			return 0;

		} else {
			int aff = 1;
			System.out.println("aff : "+aff);
			if(map.get("profile") != null) {
				System.out.println("이미지 삭제 할거야 : true");
				aff = sqlSession.delete("deleteAuctionImg", map);
				System.out.println(aff);
			}
			
			System.out.println("좋아요 삭제할그양");
			sqlSession.delete("deleteAuctionLikeNo", map);
			if (aff == 1) {
				System.out.println("가격 재설정");
				aff = sqlSession.update("updateAuctionPrice", map);
				System.out.println(aff);
			}
			if (aff == 1) {
				System.out.println("글 재설정");
				return sqlSession.update("updateAuctionList", map);
			}

			return 0;
		}
	}

	public int imageUpdate(Map map) {
		if (map.get("board").equals("우리동네")) {
			return sqlSession.insert("insertTownListImage", map);
		} else {
			return sqlSession.insert("insertAuctionImage", map);
		}
	}

	public int selectLike(Map map) {
		if (map.get("board").equals("우리동네")) {
			return sqlSession.selectOne("selectTownLike", map);
		} else {
			return sqlSession.selectOne("selectAuctionLike", map);
		}

	}

	public int insertLike(Map map) {
		if (map.get("board").equals("우리동네")) {
			return sqlSession.insert("insertTownLike", map);
		} else {
			return sqlSession.insert("insertAuctionLike", map);
		}
	}

	public int deleteLike(Map map) {
		if (map.get("board").equals("우리동네")) {
			return sqlSession.delete("deleteTownLike", map);
		} else {
			return sqlSession.delete("deleteAuctionLike", map);
		}
	}

	public List selectLikeList(Map map) {
		if (map.get("board").equals("우리동네")) {
			return sqlSession.selectList("selectTownLikeList", map);
		} else {
			return sqlSession.selectList("selectAuctionLikeList", map);
		}

	}

	public int updateLike(Map map) {
		if (map.get("board").equals("우리동네")) {
			return sqlSession.update("updateTownLike", map);
		} else {
			return sqlSession.update("updateAuctionLike", map);
		}

	}

	public int selectLikeNo(Map map) {
		if (map.get("board").equals("우리동네")) {
			return sqlSession.selectOne("selectTownLikeNo", map);
		} else {
			return sqlSession.selectOne("selectAuctionLikeNo", map);
		}

	}

	public int updatePrice(Map map) {
		return sqlSession.update("updatePrice", map);
	}

	public List<BoardDTO> mypageSelllist(Map map) {
		return sqlSession.selectList("mypageSelllist", map);
	}

	public int updateStatus(Map map) {
		return sqlSession.update("updateAuctionStatus", map);
	}

	public List<BoardDTO> mypagelikelist(Map map) {
		return sqlSession.selectList("mypagelikelist", map);
	}

	public List<BoardDTO> searchGropBoard(Map map) {
		return sqlSession.selectList("searchGropBoard", map);
	}

	public List<BoardDTO> searchAuction(Map map) {
		return sqlSession.selectList("searchAuction", map);
	}

	public List<BoardDTO> searchProduct(Map map) {
		return sqlSession.selectList("searchProduct", map);
	}

	public int insertNewAddress(Map map) {
		return sqlSession.insert("insertNewAddress", map);
	}

	public BoardDTO getWriteAuctionView(Map map) {
		return sqlSession.selectOne("getWriteAuctionView", map);
	}

	public AddressDTO getUpdateAddress(Map map) {
		return sqlSession.selectOne("getUpdateAddress", map);
	}

	public int updateAddress(Map map) {
		return sqlSession.update("updateAddress", map);
	}
	
	public List<BoardDTO> mainPageListNoAddr(Map map) {
		return sqlSession.selectList("mainPageListNoAddr", map);
	}

	public List<BoardDTO> mainPageListYesAddr(Map map) {
		return sqlSession.selectList("mainPageListYesAddr", map);
	}

	public List<BoardDTO> mypagepurchaselist(Map map) {
		return sqlSession.selectList("mypagepurchaselist", map);
	}
	
	public int getLikeCount(Map map) {
		return sqlSession.selectOne("getLikeCount", map);
	}

	public int getSellCount(Map map) {
		return sqlSession.selectOne("getSellCount", map);
	}

	public int getBuyCount(Map map) {
		return sqlSession.selectOne("getBuyCount", map);
	}

	public int selectLiveLike(Map map) {
		return sqlSession.selectOne("selectLiveLike", map);
	}
	

}
