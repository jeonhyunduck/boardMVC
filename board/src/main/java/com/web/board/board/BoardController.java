package com.web.board.board;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.board.service.BoardService;
import com.web.board.vo.BoardValueObject;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardController {
	
	@Resource
	private BoardService boardService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/selectList")
	public String selectList (Model model, String keyword) {
		
		List<BoardValueObject> list= boardService.selectList(keyword);
		System.out.println("list size : " + list.size());
		model.addAttribute("list", list);
		
		return "board/selectList";
	}
	
}
