package com.carrot.marketapp.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrot.marketapp.model.dao.UserDAO;
import com.carrot.marketapp.model.dto.UserDTO;

@Service("payService")
public class PayService {

	@Autowired
	UserDAO userdao;
	
	public int payCreateAmount(Map map) { return userdao.payCreateAmount(map); }

	public int payLog(Map map) { return userdao.payLog(map); }
	
	public UserDTO getPayNo(Map map) {return userdao.getPayNo(map); }
		
	public int payDeposit(Map map) { return userdao.payDeposit(map); }
	
	public int payWithdraw(Map map) { return userdao.payWithdraw(map); }
	
	public UserDTO payBalance(Map map) { return userdao.payBalance(map); }
	
	
}
