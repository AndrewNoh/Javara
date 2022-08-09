package com.carrot.marketapp.web.admin;

import java.security.Principal;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carrot.marketapp.model.dto.AddressDTO;
import com.carrot.marketapp.model.dto.BoardDTO;
import com.carrot.marketapp.model.dto.ImageDTO;
import com.carrot.marketapp.model.dto.UserDTO;
import com.carrot.marketapp.model.service.impl.AddressServiceimpl;
import com.carrot.marketapp.model.service.impl.BoardServiceimpl;
import com.carrot.marketapp.model.service.impl.ImageServiceimpl;
import com.carrot.marketapp.model.service.impl.UserServiceimpl;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/admin")

public class AdminController {
	
	
	@Autowired
	BoardServiceimpl boardService;

	@Autowired
	UserServiceimpl userService;

	@Autowired
	AddressServiceimpl addressService;

	@Autowired
	ImageServiceimpl imageService;
	
	
	public Map getUserInfo(Map map, Model model, Principal principal) {
		
	      int userCount = userService.selectList(map);
	      System.out.println(map);
	      
	      map.put("userCount", userCount);
	      
	      return map;
	}

	@RequestMapping("/admin.do")
	public String setModel(Map map, Model model, Principal principal) {
		map = getUserInfo(map, model, principal);
		model.addAttribute("userCount",map.get("userCount"));
		System.out.println(map.get("userCount"));

		return "/admin/Admin.market";
	}
	
	
	
	@RequestMapping("/admingropboard.do")
	public String AdminGropBoardList(Map map, Model model, Principal principal) {
		model.addAttribute("board", "우리동네");
		map.put("email", principal.getName());
		model.addAttribute("email", principal.getName());
		
		map = getUserInfo(map, model, principal);

		if (map.get("nowpage") == null) {
			map.put("nowpage", "1");
		}

		int page = Integer.parseInt((String) map.get("nowpage"));

		map.put("startnum", (30 * (page - 1)));
		map.put("endnum", 30 * (page) + 1);

		if (map.get("category") == null) {
			map.put("category", "모두");
		}

		UserDTO user = userService.selectOne(map);

		map.put("userno", user.getUserno());
		model.addAttribute("userno", user.getUserno());

		AddressDTO address = addressService.selectOne(map);

		String simpleAddr = address.getSimpleAddress();

		map.put("simpleAddress", simpleAddr);
		// 리스트 받아오기
		List<BoardDTO> Lists = boardService.selectList(map);

		model.addAttribute("address", simpleAddr);
		model.addAttribute("LISTS", Lists);

		List<List<ImageDTO>> imageList = new Vector<List<ImageDTO>>();

		for (int i = 0; i < Lists.size(); i++) {
			
			map.put("townlist_no", Lists.get(i).getTownlist_no());
			

			List<ImageDTO> images = imageService.selectList(map);
			imageList.add(images);
		}
		
		model.addAttribute("imageList", imageList);
		model.addAttribute("address", map.get("simpleAddress"));
		model.addAttribute("LISTS", Lists);
		model.addAttribute("nowUser", map.get("userno"));

		return "/admin/AdminGropBoardList.market";
	}
	
	@RequestMapping("/adminauction.do")
	public String AdminAuctionboard(Map map, Model model, Principal principal) {
		model.addAttribute("board", "경매");
		map.put("email", principal.getName());
		model.addAttribute("email", principal.getName());
		
		map = getUserInfo(map, model, principal);

		if (map.get("nowpage") == null) {
			map.put("nowpage", "1");
		}

		int page = Integer.parseInt((String) map.get("nowpage"));

		map.put("startnum", (30 * (page - 1)));
		map.put("endnum", 30 * (page) + 1);

		if (map.get("category") == null) {
			map.put("category", "모두");
		}

		UserDTO user = userService.selectOne(map);

		map.put("userno", user.getUserno());
		model.addAttribute("userno", user.getUserno());

		AddressDTO address = addressService.selectOne(map);

		String simpleAddr = address.getSimpleAddress();

		map.put("simpleAddress", simpleAddr);
		// 리스트 받아오기
		List<BoardDTO> Lists = boardService.selectList(map);

		model.addAttribute("address", simpleAddr);
		model.addAttribute("LISTS", Lists);

		List<List<ImageDTO>> imageList = new Vector<List<ImageDTO>>();

		for (int i = 0; i < Lists.size(); i++) {
			
			map.put("auction_no", Lists.get(i).getAuction_no());
			

			List<ImageDTO> images = imageService.selectList(map);
			imageList.add(images);
		}
		
		model.addAttribute("imageList", imageList);
		model.addAttribute("address", map.get("simpleAddress"));
		model.addAttribute("LISTS", Lists);
		model.addAttribute("nowUser", map.get("userno"));

		return "/admin/AdminAuctionList.market";
	}
	
	@RequestMapping(value = "/delete.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int delete(@RequestParam Map map, Model model, Principal principal) {
		return userService.delete(map);

	}

	@RequestMapping("/deleteAdminTown.do")
	public String deleteAdminTown(@RequestParam Map map, Model model, Principal principal) {
		userService.delete(map);
		System.out.println("map:"+map);
		
		return "forward:/admin/admingropboard.do";

	}
	
	@RequestMapping("/deleteAdminAuction.do")
	public String deleteAdminAuction(@RequestParam Map map, Model model, Principal principal) {
		userService.delete(map);
		System.out.println("map:"+map);
		
		return "forward:/admin/adminauction.do";

	}
	
}
