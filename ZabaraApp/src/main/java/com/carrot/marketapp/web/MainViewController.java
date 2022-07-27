package com.carrot.marketapp.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carrot.marketapp.model.dto.BoardDTO;
import com.carrot.marketapp.model.dto.ImageDTO;
import com.carrot.marketapp.model.service.impl.AddressServiceimpl;
import com.carrot.marketapp.model.service.impl.BoardServiceimpl;
import com.carrot.marketapp.model.service.impl.ImageServiceimpl;
import com.carrot.marketapp.model.service.impl.UserServiceimpl;

@Controller
public class MainViewController {

	@Autowired
	BoardServiceimpl boardService;
	
	@Autowired
	ImageServiceimpl imageService;
	
	@Autowired
	UserServiceimpl userService;
	
	@Autowired
	AddressServiceimpl addressService;
	
	@RequestMapping({ "/", "/location/MainPage.do" })
	public String mainPage(Authentication auth, Model model) {
		Map map = new HashMap();
		List<BoardDTO> Lists = null;
		List<List<ImageDTO>> imageList = new Vector<List<ImageDTO>>();
		map.put("board", "");
		
		String simpleAddr = "";
		
		if (auth != null) {
			String id = auth.getName();
			map.put("email", auth.getName());
			map.put("userno",userService.selectOne(map).getUserno());
			simpleAddr = addressService.selectOne(map).getSimpleAddress();
		}
		
		if(simpleAddr.equals("")) {
			Lists = boardService.mainPageListNoAddr(map);
		} else {
			map.put("simpleAddress", simpleAddr);
			Lists = boardService.mainPageListYesAddr(map);
		}
		
		model.addAttribute("lists", Lists);
		
		for (BoardDTO list : Lists) {
			map.put("auction_no", list.getAuction_no());
			List<ImageDTO> images = imageService.selectList(map);
			imageList.add(images);
		}
		
		model.addAttribute("imageList", imageList);
		
		return "MainPage.market";
	}

}
