package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.repository.BoardRepository;
import com.javaex.vo.BoardVO;

@Service
public class BoardService {
	// 필드
	@Autowired
	private BoardRepository boardRepository;

	// 메소드 일반
	// - 게시판 전체리스트
	@RequestMapping(value = "/board/exelist", method = { RequestMethod.GET, RequestMethod.POST })
	public List<BoardVO> exeList() {
		System.out.println("BoardService.exelist()");

		List<BoardVO> boardList = boardRepository.boardSelectList();

		return boardList;
	}
	
	// - 게시판 등록
	@RequestMapping(value = "/board/exewrite", method = { RequestMethod.GET, RequestMethod.POST })
	public int exeWrite(BoardVO boardVO) {
		System.out.println("BoardService.exeWrite()");
		
		int count = boardRepository.boardInsert(boardVO);
		
		return count;
	}

	// - 게시판 삭제
	@RequestMapping(value = "/board/exeremove", method = { RequestMethod.GET, RequestMethod.POST })
	public int exeRomove(int no) {
		System.out.println("BoardService.exeRomove()");
		
		int count = boardRepository.boardDelete(no);
		System.out.println(count);
		
		return count;
	}

}
