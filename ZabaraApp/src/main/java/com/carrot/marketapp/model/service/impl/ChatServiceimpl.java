package com.carrot.marketapp.model.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrot.marketapp.model.dao.ChatDAO;
import com.carrot.marketapp.model.dao.UserDAO;
import com.carrot.marketapp.model.dto.ChatDTO;
import com.carrot.marketapp.model.dto.UserDTO;


@Service("chatService")
public class ChatServiceimpl {
	
	@Autowired
	ChatDAO chatDAO;
	
	@Autowired
	UserDAO userDAO;
	
	public ChatDTO userlist(Map map) {
		return chatDAO.userList(map);
	}
	
	public UserDTO userselectOne(Map map) {
		return userDAO.selectOne(map);
	}
	
	public ChatDTO findChatRoom(Map map){
		return chatDAO.findChatRoom(map);
	}
		
	public List<ChatDTO> createChatRoomno(Map map){
		return chatDAO.createChatRoomno(map);
	}

	public int insertChatMessage(Map map) {
		return chatDAO.insertChatMessage(map);
	}

	public List<ChatDTO> viewChatMessage(Map map) {
		return chatDAO.viewChatMessage(map);
	}
	
	public List<ChatDTO> chatlist(Map map) {
		return chatDAO.chatlist(map);
	}

	public int updateChatRoomno(Map map) {
		return chatDAO.updateChatRoomno(map);
		
	}

	public List<ChatDTO> profileimge(Map map) {
		return chatDAO.profileimg(map);
	}
	
	public ChatDTO findnickname(Map map){
		return chatDAO.findnickname(map);
	}
	
	public List<ChatDTO> unreadcount(Map map) {
		return chatDAO.unreadcount(map);
	}

	public List<ChatDTO> readmsg(Map map) {
		return chatDAO.readmsg(map);
	}

	public int insertChatimg(Map map) {
		return chatDAO.insertChatimg(map);
		
	}

	public int deleteChatRoom(Map map) {
		return chatDAO.deleteChatRoom(map);		
	}
	
	
	public int deleteChatMsg(Map map) {
		return chatDAO.deleteChatMsg(map);		
	}

	public int updateChatMsg(Map map) {
		return chatDAO.updateChatMsg(map);			
	}


	
}
