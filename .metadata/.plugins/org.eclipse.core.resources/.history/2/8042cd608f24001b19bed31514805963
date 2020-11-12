package com.web.board.service;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.web.board.dao.BoardDAO;
import com.web.board.vo.BoardValueObject;

@Service
public class BoardService {
	
	@Resource
	private BoardDAO boardDAO;
	
	public List<BoardValueObject> selectList(String keyword) { //������ ��ȸ
		List<BoardValueObject> list = boardDAO.selectList(keyword);
		
		return list;
	}
	
	public BoardValueObject selectOne(int board_id) {
		return boardDAO.selectOne(board_id);
	}

}
