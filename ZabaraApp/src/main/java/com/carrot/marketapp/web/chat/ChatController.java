package com.carrot.marketapp.web.chat;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.carrot.marketapp.model.dto.BoardDTO;
import com.carrot.marketapp.model.dto.ChatDTO;
import com.carrot.marketapp.model.dto.ImageDTO;
import com.carrot.marketapp.model.dto.UserDTO;
import com.carrot.marketapp.model.service.impl.BoardServiceimpl;
import com.carrot.marketapp.model.service.impl.ChatServiceimpl;
import com.carrot.marketapp.model.service.impl.ImageServiceimpl;
import com.carrot.marketapp.model.service.impl.UserServiceimpl;
import com.carrot.marketapp.util.FileUpDownUtils;

@Controller
@RequestMapping("/chat")
public class ChatController {

   @Autowired
   ChatServiceimpl chatService;
   @Autowired
   UserServiceimpl userService;
   @Autowired
   BoardServiceimpl boardService;
   @Autowired
   ImageServiceimpl imageService;

   @GetMapping("/chatting.do")
   public String chatting(Model model, @RequestParam Map map, Principal principal) {

      model.addAttribute("wirtenickName", map.get("wirtenickName"));

      model.addAttribute("auction_no", map.get("auction_no"));
      model.addAttribute("townlist_no", map.get("townlist_no"));

      model.addAttribute("writeuserno", map.get("writeuserno"));

      map.put("email", principal.getName());
      UserDTO userNickname = userService.selectOne(map);
      model.addAttribute("userNickname", userNickname);
      map.put("userno", userNickname.getUserno());
      model.addAttribute("profileimage", userNickname.getProfile_img());
      model.addAttribute("userno", map.get("userno"));
      model.addAttribute("userno", map.get("userno"));

      ChatDTO chatroom = chatService.findChatRoom(map);
      model.addAttribute("auction_no", map.get("auction_no"));
      model.addAttribute("townlist_no", map.get("townlist_no"));
      model.addAttribute("chatroom", chatroom);

      if (chatroom != null) {
         System.out.println("GET방식 방번호 중복");

         map.put("roomno", chatroom.getRoomno());
         model.addAttribute("sendusernickname", chatroom.getSendusernickname());
         model.addAttribute("writeusernickname", chatroom.getWriteusernickname());

         model.addAttribute("roomno", chatroom.getRoomno());
         List<ChatDTO> msg = chatService.viewChatMessage(map);
         model.addAttribute("message", msg);
         model.addAttribute("userno", map.get("userno"));
         ChatDTO nicknames = chatService.findnickname(map);
         model.addAttribute("nicknames", nicknames);
         List<ChatDTO> readmsg = chatService.readmsg(map);
      } else {
         model.addAttribute("roomno", '0');
      }

      BoardDTO list;
      if (Integer.parseInt((String) map.get("auction_no")) > 0) {
         int no = Integer.parseInt((String) map.get("auction_no"));
         map.put("no", map.get("auction_no"));
         map.put("board", "경매");
         list = boardService.selectOne(map);
         model.addAttribute("auction_no", no);
         map.put("auction_no", map.get("auction_no"));
         List<ImageDTO> image = imageService.selectList(map);
         model.addAttribute("images", image);
         model.addAttribute("list", list);
      } else {
         int no = Integer.parseInt((String) map.get("townlist_no"));
         map.put("no", map.get("townlist_no"));
         map.put("board", "우리동네");
         list = boardService.selectOne(map);
         model.addAttribute("townlist_no", no);
         model.addAttribute("townlist_no", map.get("townlist_no"));
         List<ImageDTO> image = imageService.selectList(map);

         model.addAttribute("images", image);
         model.addAttribute("list", list);
      }

      return "/chat/Chatting.market";
   }

   @PostMapping("/chatting.do")
   @ResponseBody
   public String sendChatting(Model model, @RequestParam Map map, Principal principal) {

      map.put("email", principal.getName());
      UserDTO user = userService.selectOne(map);
      map.put("userno", user.getUserno());
      map.put("writeuserno", map.get("writeuserno"));

      ChatDTO chatroom = chatService.findChatRoom(map);

      if (chatroom != null) {
         System.out.println("방번호 중복");
         map.put("roomno", chatroom.getRoomno());
         map.put("chatcontent", map.get("chatcontent"));
         map.put("senduserno", map.get("userno"));
         map.put("unread_count", '1');
         map.put("sendtime", map.get("sendtime"));
         
         chatService.insertChatMessage(map);
         chatService.updateChatRoomno(map);
         
      } else {
         if (Integer.parseInt((String) map.get("auction_no")) == 0) {
            map.put("auction_no", "");
         }
         if (Integer.parseInt((String) map.get("townlist_no")) == 0) {
            map.put("townlist_no", "");
         }

         chatService.createChatRoomno(map);
         
         chatroom = chatService.findChatRoom(map);
         map.put("roomno",chatroom.getRoomno());
         map.put("chatcontent", chatroom.getChatcontent());
         map.put("senduserno", map.get("userno"));
         map.put("unread_count", '1');
         map.put("sendtime", map.get("sendtime"));

         chatService.insertChatMessage(map);
         
      }

      return "/chat/Chatting.market";
   }

   @PostMapping(value = "/chatimg.do", produces = "application/json;charset=UTF-8")
   @ResponseBody
   public String sendimg(@RequestParam MultipartFile chatimg, HttpServletRequest req, Model model, Principal principal,
         @RequestParam Map map) throws IllegalStateException, IOException {
      System.out.println("사진");
      String path = req.getSession().getServletContext().getRealPath("/resources/assets/img/chat_img");
      String rename = FileUpDownUtils.getNewFileName(path, chatimg.getOriginalFilename());
      File dest = new File(path + File.separator + rename);
      chatimg.transferTo(dest);
      
      
      map.put("email", principal.getName());
      UserDTO user = userService.selectOne(map);
      map.put("userno", user.getUserno());
      map.put("writeuserno", map.get("writeuserno"));

      ChatDTO chatroom = chatService.findChatRoom(map);

      if (chatroom != null) {
         System.out.println("방번호 중복");
         map.put("chatimg", rename);
         map.put("senduserno", map.get("userno"));
         map.put("roomno", chatroom.getRoomno());
         map.put("chatcontent", "사진");
         map.put("unread_count", "1");
         map.put("img", rename);
         var sendimg = chatService.insertChatimg(map);
         model.addAttribute("img", sendimg);
         chatService.updateChatRoomno(map);
         
      } else {
         if (Integer.parseInt((String) map.get("auction_no")) == 0) {
            map.put("auction_no", "");
         }
         if (Integer.parseInt((String) map.get("townlist_no")) == 0) {
            map.put("townlist_no", "");
         }

         chatService.createChatRoomno(map);
         
         chatroom = chatService.findChatRoom(map);
         map.put("chatimg", rename);
         map.put("senduserno", map.get("userno"));
         map.put("roomno", chatroom.getRoomno());
         map.put("chatcontent", "사진");
         map.put("unread_count", "1");
         map.put("img", rename);
         var sendimg = chatService.insertChatimg(map);
         model.addAttribute("img", sendimg);
         chatService.updateChatRoomno(map);
         
      }
      
      return rename;
   }

   @PostMapping(value = "/chattingemoji.do", produces = "application/json;charset=UTF-8")
   @ResponseBody
   public String emoji(Model model, @RequestParam Map map, Principal principal) {
	   map.put("email", principal.getName());
	      UserDTO user = userService.selectOne(map);
	      map.put("userno", user.getUserno());
	      map.put("writeuserno", map.get("writeuserno"));

	      ChatDTO chatroom = chatService.findChatRoom(map);

	      if (chatroom != null) {
	         System.out.println("방번호 중복");
	         map.put("senduserno", map.get("userno"));
	         map.put("roomno",chatroom.getRoomno());
	         map.put("unread_count", "1");
	         map.put("img",  map.get("img"));
	         var sendimg = chatService.insertChatimg(map);
	         model.addAttribute("img", sendimg);
	         chatService.updateChatRoomno(map);
	         
	      } else {
	         if (Integer.parseInt((String) map.get("auction_no")) == 0) {
	            map.put("auction_no", "");
	         }
	         if (Integer.parseInt((String) map.get("townlist_no")) == 0) {
	            map.put("townlist_no", "");
	         }

	         chatService.createChatRoomno(map);
	         
	         chatroom = chatService.findChatRoom(map);
	         map.put("senduserno", map.get("userno"));
	         map.put("roomno",chatroom.getRoomno());
	         map.put("unread_count", "1");
	         map.put("img",  map.get("img"));
	         var sendimg = chatService.insertChatimg(map);
	         model.addAttribute("img", sendimg);
	         chatService.updateChatRoomno(map);
	         
	      }
      return "/chat/Chatting.market";
   }
   
   @PostMapping(value = "/deletchtroom.do", produces = "application/json;charset=UTF-8")
   @ResponseBody
   public String deletchtroom(Model model, @RequestParam Map map, Principal principal) {
	   map.put("email", principal.getName());
	   map.put("senduserno", map.get("userno"));
	   map.put("roomno", map.get("roomno"));
	   chatService.deleteChatMsg(map);
	   chatService.deleteChatRoom(map);
	   return "/chat/ChattingRoom.market";
   }

}