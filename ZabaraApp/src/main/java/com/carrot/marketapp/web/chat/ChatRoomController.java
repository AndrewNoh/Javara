package com.carrot.marketapp.web.chat;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carrot.marketapp.model.dto.ChatDTO;
import com.carrot.marketapp.model.dto.UserDTO;
import com.carrot.marketapp.model.service.impl.ChatServiceimpl;
import com.carrot.marketapp.model.service.impl.UserServiceimpl;

@Controller
@RequestMapping("/chat")
public class ChatRoomController {

	@Autowired
	ChatServiceimpl chatService;
	@Autowired
	UserServiceimpl userService;

	@GetMapping("/chattingroom.do")
	public String chattingroom(Model model, @RequestParam Map map, Principal principal) {
		map.put("email", principal.getName());
		UserDTO userNickname = userService.selectOne(map);
		model.addAttribute("userNickname", userNickname);
		model.addAttribute("profileimage", userNickname.getProfile_img());
		map.put("userno", userNickname.getUserno());
		model.addAttribute("userno", map.get("userno"));
		List<ChatDTO> chatlist = chatService.chatlist(map);
		model.addAttribute("chatlist", chatlist);
		map.put("unread_count", "1");
		map.put("senduserno", userNickname.getUserno());
		List<ChatDTO> unreadcount = chatService.unreadcount(map);
		model.addAttribute("unreadcount", unreadcount);

		return "/chat/ChattingRoom.market";
	}
	

}
