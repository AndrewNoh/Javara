package com.carrot.marketapp.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrot.marketapp.model.dto.PayDTO;
import com.carrot.marketapp.model.dto.UserDTO;
import com.carrot.marketapp.model.service.PayService;

@Repository("payDAO")
public class PayDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	public int payCreateAmount(Map map) {		
			return sqlSession.insert("payCreateAmount", map);		
		}
			
		public int payLog(Map map) {
			return sqlSession.insert("payLog", map);
		}
			
		public PayDTO getPayNo(Map map) {
			return sqlSession.selectOne("payLogNo", map);
		}
			
		public PayDTO payBalance(Map map) {	
			return sqlSession.selectOne("payBalance", map);	
		}
			
		public int payDeposit(Map map) {
			return sqlSession.insert("payDeposit", map);
		}
			
		public int payWithdraw(Map map) {	
			return sqlSession.update("payWithdraw", map);
		}
		


}
