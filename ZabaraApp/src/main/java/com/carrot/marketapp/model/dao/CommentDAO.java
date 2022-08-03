package com.carrot.marketapp.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carrot.marketapp.model.dto.CommentDTO;

import antlr.collections.List;

@Repository("CommentDAO")
public class CommentDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int commentInsert(Map map) {
	    return sqlSession.insert("commentInsert", map);
	}
	   
	public java.util.List<CommentDTO> commentSelectList(Map map) { 
		return sqlSession.selectList("commentSelectList", map);
	}
	   
	public int commentUpdate(Map map) {
	    return sqlSession.update("commentUpdate", map);
	}
	   
	public int commentDelete(Map map) { // 댓글 번호로 삭제
	    return sqlSession.delete("commentDelete", map);
	}
	   

   
}
