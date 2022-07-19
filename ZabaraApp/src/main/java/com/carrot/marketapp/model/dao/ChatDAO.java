package com.carrot.marketapp.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrot.marketapp.model.dto.ChatDTO;
import com.carrot.marketapp.model.dto.UserDTO;


@Repository("chatDAO")
public class ChatDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public ChatDTO userList(Map map) {
		return sqlSession.selectOne("userList", map);
	}
	
	public UserDTO userselectOne(Map map) {
		return sqlSession.selectOne("userselectOne",map);
	}

	public ChatDTO findChatRoom(Map map) {
		return sqlSession.selectOne("findChatRoom", map);
	}
	
	public List<ChatDTO> createChatRoomno(Map map) {
		return sqlSession.selectList("createChatRoomno", map);
	}
	public int insertChatMessage(Map map) {
		return sqlSession.insert("insertChatMessage", map);
	}
	

	public List<ChatDTO> viewChatMessage(Map map) {
		return sqlSession.selectList("viewChatMessage", map);
	}
	
	public List<ChatDTO> chatlist(Map map) {
		return sqlSession.selectList("chatlist", map);
	}

	public int updateChatRoomno(Map map) {
		return sqlSession.update("updateChatRoomno", map);
	}

	public List<ChatDTO> profileimg(Map map) {
		return sqlSession.selectList("profileimg", map);
	}
	

	public ChatDTO findnickname(Map map) {
		return sqlSession.selectOne("findnickname", map);
	}
	
	
	
	
}
