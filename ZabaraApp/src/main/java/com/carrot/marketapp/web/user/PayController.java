package com.carrot.marketapp.web.user;

import java.security.Principal;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carrot.marketapp.model.dao.PayDAO;
import com.carrot.marketapp.model.dto.PayDTO;
import com.carrot.marketapp.model.dto.UserDTO;
import com.carrot.marketapp.model.service.PayService;
import com.carrot.marketapp.model.service.impl.PayServiceimpl;
import com.carrot.marketapp.model.service.impl.UserServiceimpl;

@Controller
@RequestMapping("/pay")
public class PayController {
	
	@Autowired
	PayServiceimpl payService;
	
	@Autowired
	UserServiceimpl userService;
	

	@RequestMapping("/balance.do")
	@ResponseBody
	public int payService(Model model,@RequestParam Map map, Principal principal) {
		map.put("email", principal.getName());
		UserDTO userno = userService.selectOne(map);
		map.put("userno", userno.getUserno());
		
		PayDTO payno = payService.getPayNo(map);
		map.put("payno", payno.getPayno());
		
		PayDTO balance = payService.payBalance(map);
		
		// 입금/충전
		int deposit = Integer.parseInt((String) map.get("deposit"));
		if(!(deposit == 0)) {
			int depositBalance = Integer.parseInt(balance.getBalance())+deposit;
			map.put("balance", depositBalance);
		
			deposit = payService.payDeposit(map);
			balance = payService.payBalance(map);	
			
		}
		
		// 출금
		int withdraw = Integer.parseInt((String) map.get("withdraw"));
		if(!(withdraw == 0)) {
			int withdrawBalance = Integer.parseInt(balance.getBalance())-withdraw;
			map.put("balance", withdrawBalance);
			
			withdraw = payService.payWithdraw(map);
			balance = payService.payBalance(map);
			
		}
		
		// 송금 
		int remit = Integer.parseInt((String) map.get("withdraw"));
		if(!(remit == 0)) {
			int remitBalance = Integer.parseInt(balance.getBalance())-remit;
			map.put("balance", remitBalance);
		
			balance = payService.payBalance(map);
		}
		
		// 송금 받기
		int charge = Integer.parseInt((String) map.get("deposit"));
		System.out.println(charge);
		if(!(charge == 0)) {
			int chargeBalance = Integer.parseInt(balance.getBalance())+charge;
			map.put("balance", chargeBalance);
			System.out.println(chargeBalance);
			
			balance = payService.payBalance(map);	
		}
		
		return Integer.parseInt(balance.getBalance());
	}
}
	

