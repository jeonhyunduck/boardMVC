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
	public void insert_action(BoardValueObject vo) {
		boardDAO.insert_action(vo);
	}
	public void delete_action(int board_id) {
		boardDAO.delete_action(board_id);
	}
	public void update_action(BoardValueObject vo) {
		boardDAO.update_action(vo);
	}

}
