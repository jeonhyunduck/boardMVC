package com.web.board.dao;


import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.web.board.vo.BoardValueObject;
	
@Repository
public class BoardDAO {
	@Resource(name = "boardSqlSession")
	private SqlSessionTemplate sqlTemplate;
	
	public List<BoardValueObject> selectList(String keyword) {
		System.out.println("ddd: "+keyword);
		List<BoardValueObject> list = sqlTemplate.selectList("BoardMapper.selectList", keyword);
		
		
		return list;
	}
	
	public BoardValueObject selectOne(int board_id) {
		return sqlTemplate.selectOne("BoardMapper.selectOne", board_id);
		
		//BoardValueObject vo = sqlTemplate.selectOne("BoardMapper.selectOne", board_id);
	    //return vo;
	}

}
