package com.carrot.marketapp.model.service;

import java.util.Map;


public interface CommonService<T> {

	
	//상세보기용]
	T selectOne(Map map);
	//입력/수정/삭제용]	
	int insert(Map map);
	int delete(Map map);
	int update(Map map);
	//키로 이름 찾는 메소드
	String findNameByKey(Map map);
	
	
}
