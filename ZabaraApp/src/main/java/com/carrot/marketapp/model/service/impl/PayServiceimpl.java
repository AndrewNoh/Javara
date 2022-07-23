package com.carrot.marketapp.model.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrot.marketapp.model.dao.PayDAO;
import com.carrot.marketapp.model.dto.PayDTO;
import com.carrot.marketapp.model.dto.UserDTO;

@Service("PayService")
public class PayServiceimpl {
	
		@Autowired
		PayDAO paydao;
	
		public int payCreateAmount(Map map) {
			
			return paydao.payCreateAmount(map);
		}
		
		public PayDTO getPayNo(Map map) {

			return paydao.getPayNo(map);
		}
		
		public int payLog(Map map) {
			
			return paydao.payLog(map);		
		}

		public int payDeposit(Map map) {
			
			return paydao.payDeposit(map);		
		}
		
		public int payWithdraw(Map map) {
			
			return paydao.payWithdraw(map);		
		}
		
		public PayDTO payBalance(Map map) {
			
			return paydao.payBalance(map);		
		}

}
