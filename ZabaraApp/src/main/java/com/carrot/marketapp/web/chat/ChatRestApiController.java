package com.carrot.marketapp.web.chat;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.carrot.marketapp.model.service.impl.ChatServiceimpl;
import com.carrot.marketapp.util.FileUpDownUtils;

@Controller
public class ChatRestApiController {

	@Autowired
	ChatServiceimpl chatService;
	
	@Autowired
    private ServletContext servletContext;

	@RequestMapping("/chat/insertimgfromapp.do")
	public @ResponseBody Map insertImgFromApp(@RequestPart MultipartFile chatimg, HttpServletRequest req)
			throws IllegalStateException, IOException {
        Map map = new HashMap();
        map.put("room_no",req.getParameter("roomno"));
        map.put("senduserno", req.getParameter("senduserno"));
        map.put("unread_count", req.getParameter("unread_count"));
        map.put("chatcontent", req.getParameter("chatcontent"));
		
		String path = servletContext.getRealPath("/resources/assets/img/chat_img");
		String rename = FileUpDownUtils.getNewFileName(path, chatimg.getOriginalFilename());
		File dest = new File(path + File.separator + rename);
		chatimg.transferTo(dest);
		map.put("img", rename);
		chatService.insertChatimg(map);
		chatService.updateChatRoomno(map);
		return map;
	}

}
