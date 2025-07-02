package com.javaex.repository;

import java.util.List;
import java.util.Map;

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

	// - 게시판 전체리스트2(페이징)
	public List<BoardVO> boardSelectList2(Map<String, Integer> limitMap) {
		System.out.println("BoardRepository.boardSelectList2()");

		List<BoardVO> boardList = sqlSession.selectList("board.selectList2", limitMap);

		return boardList;

	}
	
	// - 게시판 전체리스트3(페이징, 검색)
	public List<BoardVO> boardSelectList3(Map<String, Object> limitMap) {
		System.out.println("BoardRepository.boardSelectList3()");
		
		List<BoardVO> boardList = sqlSession.selectList("board.selectList3", limitMap);

		return boardList;

	}

	// -- 전체 글갯수(페이징)
	public int selectTotalCount() {
		System.out.println("BoardRepository.selectTotalCount(");

		int totalCount = sqlSession.selectOne("board.selectTotalCount");

		return totalCount;
	}
	
	// -- 전체 글갯수(페이징, 검색)
	public int selectTotalCountByKwd(String kwd) {
		System.out.println("BoardRepository.selectTotalCountByKwd(");

		int totalCount = sqlSession.selectOne("board.selectTotalCountByKwd", kwd);

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
	public int boardDelete(BoardVO boardVO) {
		System.out.println("BoardRepository.boardDelete()");

		int count = sqlSession.delete("board.delete", boardVO);

		return count;
	}
}
