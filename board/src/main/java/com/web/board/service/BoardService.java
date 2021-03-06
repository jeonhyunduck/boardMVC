package com.web.board.service;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.web.board.dao.BoardDAO;
import com.web.board.vo.BoardValueObject;
import com.web.board.vo.PagingVO;


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
	
	// 게시물 총 갯수
	public int countBoard(String keyword) {
		return boardDAO.countBoard(keyword);
	}

	// 페이징 처리 게시글 조회
	public List<BoardValueObject> selectBoard(PagingVO vo){
		return boardDAO.selectBoard(vo);
	}

}
