package com.carrot.marketapp.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrot.marketapp.model.dto.UserDTO;
import com.carrot.marketapp.model.service.PayService;

@Repository("userDAO")
public class UserDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public int insert(Map map) {
		if (map.get("userno") != null) {
			int affected = 0;
			int authGrant = sqlSession.insert("grantAuth", map);
			int inputResult = sqlSession.insert("inputAddress", map);
			if (authGrant == 1)
				affected = 1;
			if (inputResult == 1)
				affected = 2;
			return affected;
		} else {
			int affected = sqlSession.insert("userJoin", map);
			return affected;
		}

	}

	public UserDTO selectOne(Map map) {
		if (map.get("phone") != null) {
			return sqlSession.selectOne("userselectOneByPhoneNumber", map);// 중복 핸드폰번호 검사용 selectOne
		} else if (map.get("signup") != null) {
			return sqlSession.selectOne("userselectOneForSignup", map);// 이메일로 셀렉트 회원가입용(주소 미포함)
		} else {
			return sqlSession.selectOne("userselectOne", map);// 이메일(아이디)로 selectOne(주소포함)
		}
	}
	
	public int selectList(Map map) {
	      if(map.get("userno") !=null)
	         return sqlSession.selectOne("selectUserList",map);
	    	 
	      return 0;
	   }

	
	
	public int delete(Map map) {
		if (map.get("townlist_no") != null){
			sqlSession.delete("deleteAdminGropImg", map);
			return sqlSession.delete("deleteAdminBoard", map);
		} else if(map.get("auction_no")!= null){
			sqlSession.delete("deleteAdminAuctionImg", map);
			sqlSession.delete("deleteAdminAuctionPrice", map);
			sqlSession.delete("deleteAdminAuctionLikeNo", map);
			return sqlSession.delete("deleteAdminAuction", map);
		}
		return 0;

	}

	public int update(Map map) {
		int affected = 0;
		if (map.get("type") != null) {
			affected = sqlSession.update("EditTemporaryPassword", map);// 임시비밀번호 업데이트용
		} else if (map.get("simpleChangeProfile") != null) {
			affected = sqlSession.update("simpleChangeProfile", map);// 마이페이지 간단 프로필사진변경
		} else if (map.get("nowAddress") != null) {
			affected = sqlSession.update("simpleChangeAddr", map);// 마이페이지 간단 주소변경
		} else {
			affected = sqlSession.update("userEditUpdate", map); // 유저정보 업데이트
			affected = sqlSession.update("userEditAdressUpdate", map); // 유저정보 주소 업데이트
		}
		return affected;
	}

	public Map editselectOne(Map map) {
		return sqlSession.selectOne("userEditAdressSelect", map);
	}

	public Map mypageSelllistselectOne(Map map) {
		return sqlSession.selectOne("mypageSelllist", map);
	}

	
	
	
}
