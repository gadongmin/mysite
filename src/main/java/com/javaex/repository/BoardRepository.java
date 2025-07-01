package com.javaex.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	// - 게시판 전체리스트2(페이지)
	public List<BoardVO> boardSelectList2(Map<String, Integer> limitMap) {
		System.out.println("BoardRepository.boardSelectList2()");
		
		List<BoardVO> boardList = sqlSession.selectList("board.selectList2", limitMap);
		
		return boardList;

	}
	
	// -- 전체 글갯수		
	public int selectTotalCount(){
		System.out.println("BoardRepository.selectTotalCount(");
		
		int totalCount = sqlSession.selectOne("board.selectTotalCount");
		
		return totalCount;
	}
	
	// - 게시판 등록
	public int boardInsert(BoardVO boardVO) {
		System.out.println("BoardRepository.boardInsert()");
		
		int count = sqlSession.insert("board.insert", boardVO);
		return count;
	}
	
	// - 게시판 읽기
	public BoardVO boardSelectOne(int no) {
		System.out.println("BoardRepository.boardSelectOne");
		
		BoardVO boardVO = sqlSession.selectOne("board.selectOneList", no);
		
		return boardVO;
	}
	
	// - 게시판 수정
	public int boardUpdate(BoardVO boardVO) {
		System.out.println("BoardRepository.boardUpdate()");
		
		int count = sqlSession.update("board.update", boardVO);
		
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
