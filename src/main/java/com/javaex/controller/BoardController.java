package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.BoardService;
import com.javaex.vo.BoardVO;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	// 필드
	@Autowired
	private BoardService boardService;

	// 메소드 일반
	// - 게시판 전체리스트
	@RequestMapping(value = "/list", method = { RequestMethod.GET, RequestMethod.POST })
	public String list(Model model) {
		System.out.println("BoardController.list()");

		List<BoardVO> boardList = boardService.exeList();

		model.addAttribute("boardList", boardList);

		return "/board/list";
	}

	// - 게시판 등록폼
	@RequestMapping(value = "/writeform", method = { RequestMethod.GET, RequestMethod.POST })
	public String writeForm() {
		System.out.println("BoardController.writeform()");
		
		return "/board/writeform";
	}
	
	// - 게시판 등록
	@RequestMapping(value = "/write", method = { RequestMethod.GET, RequestMethod.POST })
	public String write(@ModelAttribute BoardVO boardVO) {
		System.out.println("BoardController.write()");
		
		boardService.exeWrite(boardVO);
		
		return "redirect:/board/list";
	}

	// - 게시판 삭제
	@RequestMapping(value = "/remove", method = { RequestMethod.GET, RequestMethod.POST })
	public String remove(@RequestParam(value = "no") int no) {
		System.out.println("BoardController.remove()");

		boardService.exeRomove(no);
		System.out.println(no);

		return "redirect:/board/list";
	}

}
