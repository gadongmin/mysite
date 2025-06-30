package com.javaex.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.BoardVO;

@Repository
public class BoardRepository {
	// 필드
	@Autowired
	private SqlSession sqlSession;
	
	// 메소드 일반
	// - 게시판 전체리스트
	public List<BoardVO> boardSelectList() {
		System.out.println("BoardRepository.boardSelectList()");
		
		List<BoardVO> boardList = sqlSession.selectList("board.selectList");
		
		return boardList;
	}
	// - 게시판 등록
	public int boardInsert(BoardVO boardVO) {
		System.out.println("BoardRepository.boardInsert()");
		
		int count = sqlSession.insert("board.insert", boardVO);
		return count;
	}
	
	
	// - 게시판 삭제	
	public int boardDelete(int no) {
		System.out.println("BoardRepository.boardDelete()");
		
		int count = sqlSession.delete("board.delete", no);
		System.out.println(count);
		
		return count;
	}
}
