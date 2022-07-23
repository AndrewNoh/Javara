package com.carrot.marketapp.web.user;

import java.security.Principal;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public int payService(Model model, Map map, Principal principal) {
		map.put("email", principal.getName());
		UserDTO userno = userService.selectOne(map);
		map.put("userno", userno.getUserno());
		
		PayDTO payno = payService.getPayNo(map);
		map.put("payno", payno.getPayno());
		
		PayDTO balance = payService.payBalance(map);
				
		return Integer.parseInt(balance.getBalance());
	}

}
