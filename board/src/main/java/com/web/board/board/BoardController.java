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
	
	@RequestMapping(value = "/selectOne")
	public String selectOne(Model model, int board_Id) {
		model.addAttribute("data", boardService.selectOne(board_Id));
		
		return "board/selectOne";
	}
	
	@RequestMapping(value = "insert")
	public String insert() {
		return "board/insert";
	}
	@RequestMapping(value = "/insert_action")
	
	public String insert_action(String board_title, String create_user, String board_contents) {
		BoardValueObject vo = new BoardValueObject();
		System.out.println("Ÿ��Ʋ"+board_title);
		vo.setBoardTitle(board_title);
		vo.setCreateUser(create_user);
		vo.setBoardContents(board_contents);
		
		boardService.insert_action(vo);
		
		return "redirect:/selectList";
	}
	@RequestMapping(value = "delete_action")
	public String delete_action(int board_Id) {
		boardService.delete_action(board_Id);
		return "redirect:/selectList";
	}
	@RequestMapping(value="update")
	public String update(Model model, int board_Id) {
		model.addAttribute("data", boardService.selectOne(board_Id));
		return "board/update";
	}
	@RequestMapping(value="update_action")
	public String update_action(BoardValueObject vo) {
		boardService.update_action(vo);
		return "redirect:/selectList";
	}
	
}
