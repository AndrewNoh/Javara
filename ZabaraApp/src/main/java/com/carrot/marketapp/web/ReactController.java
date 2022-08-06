package com.carrot.marketapp.web;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.carrot.marketapp.model.dto.BoardDTO;
import com.carrot.marketapp.model.dto.ImageDTO;
import com.carrot.marketapp.model.dto.UserDTO;
import com.carrot.marketapp.model.service.impl.AddressServiceimpl;
import com.carrot.marketapp.model.service.impl.BoardServiceimpl;
import com.carrot.marketapp.model.service.impl.ImageServiceimpl;
import com.carrot.marketapp.model.service.impl.UserServiceimpl;

@RestController
public class ReactController {

	@Autowired
	BoardServiceimpl boardService;
	
	@Autowired
	ImageServiceimpl imageService;
	
	@Autowired
	UserServiceimpl userService;
	
	@Autowired
	AddressServiceimpl addressService;
	
	@RequestMapping(value="/hotPost.do")
	public List<BoardDTO> hotPost(@RequestParam Map userinfo) throws SQLException, Exception {			
		Map map = new HashMap();
		List<BoardDTO> Lists = null;
		String simpleAddr = "";
			
		if(userinfo.get("address")!=null) {
			map.put("simpleAddress", userinfo.get("address").toString().trim());
			Lists = boardService.mainPageListYesAddr(map);			
		} else {
			Lists = boardService.mainPageListNoAddr(map);
		}
	
		return Lists;
	}
	
	
	@RequestMapping(value="/isLogin.do")
	public Map isLogin(Authentication auth) {
		Map map = new HashMap();
		if(auth != null) {
			map.put("email", auth.getName());
			UserDTO record = userService.selectOne(map);
			map.put("userinfo", record);
			map.put("login", true);
		}
		else {
			map.put("login", false);
		}
		
		return map;
	}
	
	
	
}
