package com.carrot.marketapp.model.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.carrot.marketapp.model.dao.UserDAO;
import com.carrot.marketapp.model.dto.UserDTO;
import com.carrot.marketapp.model.service.CommonService;

@Service("userService")
public class UserServiceimpl implements CommonService<UserDTO>{

	@Autowired
	UserDAO userDAO;


    public UserDTO loadUserById(String id) throws UsernameNotFoundException {
        return null;
    }

	@Override
	public UserDTO selectOne(Map map) {
		return userDAO.selectOne(map);
	}
	
	public int selectList(Map map) {
		
		return userDAO.selectList(map);
	}


	@Override
	public int insert(Map map) {
		
		return userDAO.insert(map);
	}

	@Override
	public int delete(Map map) {
		
		return userDAO.delete(map);
	}

	@Override
	public int update(Map map) {
		
		return userDAO.update(map);
	}

	@Override
	public String findNameByKey(Map map) {
		
		return null;
	}

	public int grant(Map map) {
		
		return userDAO.insert(map);
	}

	public Map mypageSelllist(Map map) {
		
		return null;
	}
	
	public Map editselectOne(Map map) {
		
		return userDAO.editselectOne(map);
	}

	
	
}
