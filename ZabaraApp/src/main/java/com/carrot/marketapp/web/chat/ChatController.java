package com.carrot.marketapp.web.chat;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.carrot.marketapp.model.dto.BoardDTO;
import com.carrot.marketapp.model.dto.ChatDTO;
import com.carrot.marketapp.model.dto.ImageDTO;
import com.carrot.marketapp.model.dto.UserDTO;
import com.carrot.marketapp.model.service.impl.BoardServiceimpl;
import com.carrot.marketapp.model.service.impl.ChatServiceimpl;
import com.carrot.marketapp.model.service.impl.ImageServiceimpl;
import com.carrot.marketapp.model.service.impl.UserServiceimpl;

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
      System.out.println("GET");
      System.out.println(map.get("auction_no"));
      System.out.println(map.get("wirteuserno"));
      System.out.println(map.get("wirtenickName"));
      
      model.addAttribute("wirtenickName",map.get("wirtenickName"));
      
      
       model.addAttribute("auction_no",map.get("auction_no"));
       model.addAttribute("product_no",map.get("product_no"));
       model.addAttribute("townlist_no",map.get("townlist_no"));
       
       
      model.addAttribute("wirteuserno",map.get("wirteuserno"));
      
      map.put("email", principal.getName());
      UserDTO userNickname =userService.selectOne(map);
      model.addAttribute("userNickname",userNickname);
      map.put("userno", userNickname.getUserno());
      model.addAttribute("profileimage", userNickname.getProfile_image());
      model.addAttribute("userno",map.get("userno"));
      System.out.println(map.get("userno"));
      model.addAttribute("userno",map.get("userno"));
      
      
      System.out.println("auction_no"+map.get("auction_no"));
      System.out.println("product_no"+map.get("product_no"));
      System.out.println("townlist_no"+map.get("townlist_no"));
      
      
      
      System.out.println("GET");
      ChatDTO chatroom=chatService.findChatRoom(map);
      model.addAttribute("auction_no",map.get("auction_no"));
      model.addAttribute("product_no",map.get("product_no"));
      model.addAttribute("townlist_no",map.get("townlist_no"));
      model.addAttribute("chatroom",chatroom);
   
      
      if(chatroom != null) {
          System.out.println("GET방식 방번호 중복");
          
          map.put("roomno",chatroom.getRoomno());
          model.addAttribute("sendusernickname", chatroom.getSendusernickname());
          model.addAttribute("writeusernickname", chatroom.getWriteusernickname());
          
          
          model.addAttribute("roomno",chatroom.getRoomno());
          List<ChatDTO> msg= chatService.viewChatMessage(map);
          model.addAttribute("message",msg);
          model.addAttribute("userno",map.get("userno"));
          ChatDTO nicknames=chatService.findnickname(map);
          model.addAttribute("nicknames",nicknames);
       }else {
          System.out.println("방오픈");
          model.addAttribute("roomno",'0');
       }
      
      BoardDTO list;
      if(Integer.parseInt((String) map.get("auction_no"))>0) {
         int no = Integer.parseInt((String) map.get("auction_no"));
         map.put("no", map.get("auction_no"));
         map.put("board", "경매");
         list = boardService.selectOne(map);
         model.addAttribute("auction_no", no);
         map.put("auction_no", map.get("auction_no"));
         List<ImageDTO> image = imageService.selectList(map);
         model.addAttribute("images",image);
         model.addAttribute("list",list);
      }else if(Integer.parseInt((String) map.get("product_no"))>0) {
         int no = Integer.parseInt((String) map.get("product_no"));
         map.put("no", map.get("product_no"));
         map.put("board", "중고물품");
         list = boardService.selectOne(map);
         model.addAttribute("product_no", no);
         map.put("product_no", map.get("product_no"));
         List<ImageDTO> image = imageService.selectList(map);
         
         model.addAttribute("images",image);
         model.addAttribute("list",list);
      }else {
         int no = Integer.parseInt((String) map.get("townlist_no"));
         map.put("no", map.get("townlist_no"));
         map.put("board", "우리동네");
         list = boardService.selectOne(map);
         model.addAttribute("townlist_no", no);
         model.addAttribute("townlist_no", map.get("townlist_no"));
         List<ImageDTO> image = imageService.selectList(map);
         
         model.addAttribute("images",image);
         model.addAttribute("list",list);
      }
      
      
       
      return "/chat/Chatting.market";
   }
   
   @PostMapping("/chatting.do")
   @ResponseBody
   public String sendChatting(Model model, @RequestParam Map map, Principal principal) {
      
      System.out.println("post");
      System.out.println(map.get("auction_no"));
      System.out.println(map.get("wirteuserno"));
      
      map.put("email", principal.getName());
      UserDTO user = userService.selectOne(map);
      map.put("userno", user.getUserno());
      map.put("wirteuserno", map.get("wirteuserno"));
      System.out.println("userno: "+map.get("userno"));
      System.out.println("auction_no: "+map.get("auction_no"));
      System.out.println("product_no"+map.get("product_no"));
      System.out.println("townlist_no"+map.get("townlist_no"));
      System.out.println("wirteuserno: "+map.get("wirteuserno"));
      System.out.println("chatcontent: "+map.get("chatcontent"));
      System.out.println("chatcontent: "+map.get("auction_no")!="");
      
   
         System.out.println("POST");
         ChatDTO chatroom=chatService.findChatRoom(map);
      
      if(chatroom != null) {
         System.out.println("방번호 중복");
          map.put("roomno",chatroom.getRoomno());
          map.put("chatcontent",map.get("chatcontent"));
          map.put("senduserno", map.get("userno"));
          map.put("unread_count", '1');
          map.put("sendtime", map.get("sendtime"));
          System.out.println(chatroom.getRoomno());
          System.out.println( map.get("sendtime"));
          chatService.insertChatMessage(map);
          chatService.updateChatRoomno(map);
      }
      else{
         System.out.println("방번호 새로생성");
         System.out.println("product_no"+map.get("product_no"));
         chatService.createChatRoomno(map);
         
            chatroom=chatService.findChatRoom(map);
         map.put("roomno",chatroom.getRoomno());
         map.put("chatcontent",chatroom.getChatcontent());
         map.put("senduserno", map.get("userno"));
         map.put("unread_count", '1');
         map.put("sendtime", map.get("sendtime"));
          System.out.println(chatroom.getRoomno());
          chatService.insertChatMessage(map);
      }
   
      return "/chat/Chatting.market";
   }
   
   
   
   
}