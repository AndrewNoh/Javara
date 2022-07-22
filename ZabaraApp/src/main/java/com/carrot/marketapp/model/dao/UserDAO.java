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
	
	@Autowired
	private PayService payService;

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
	
	// 페이 서비스
	public int payCreateAmount(Map map) {		
		return sqlSession.insert("payCreateAmount", map);		
	}
		
	public int payLog(Map map) {
		return sqlSession.insert("payLog", map);
	}
		
	public UserDTO getPayNo(Map map) {
		return sqlSession.selectOne("payLogNo", map);
	}
		
	public UserDTO payBalance(Map map) {	
		return sqlSession.selectOne("payBalance", map);	
	}
		
	public int payDeposit(Map map) {
		return sqlSession.insert("payDeposit", map);
	}
		
	public int payWithdraw(Map map) {	
		return sqlSession.update("payWithdraw", map);
	}	

}
