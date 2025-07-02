package com.javaex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.repository.BoardRepository;
import com.javaex.vo.BoardVO;

@Service
public class BoardService {
	// 필드
	@Autowired
	private BoardRepository boardRepository;

	// 메소드 일반
	// - 게시판 전체리스트
	public List<BoardVO> exeList() {
		System.out.println("BoardService.exelist()");

		List<BoardVO> boardList = boardRepository.boardSelectList();

		return boardList;
	}
	
	// - 게시판 전체리스트2(페이징)
	public Map<String, Object> exeList2(int crtPage) {
		System.out.println("BoardService.exelist2()");
		System.out.println(crtPage);
		//////////////////////////////////////////////////////////////
		//// 리스트 가져오기
		//////////////////////////////////////////////////////////////
		// - 한페이지의 출력갯수
		int listCnt = 10;
		
		// 시작번호
		/*
		 1 → (1,10) / 2 → (11,20) / 3 → (21,30) : 일반적
		  - 1부터 10개 
		 1 → (0,10) / 2 → (10,10) / 3 → (20,10) : MySQL
		  - 0부터 10개
		 계산식 :  startRowNo = (crtPage-1) * listCnt;
		  - 1페이지를 0페이지로 만들어준다.
		 */
		int startRowNo = (crtPage-1)*listCnt;
		
		// 두개의 데이터를 묶는다, MAP사용
		Map<String, Integer> limitMap = new HashMap<String, Integer>();
		limitMap.put("startRowNo", startRowNo); // 시작페이지
		limitMap.put("listCnt", listCnt);		// 출력되는 페이지 수
		
		// Repositoryd에게 보낸다
		List<BoardVO> boardList = boardRepository.boardSelectList2(limitMap);
				
		
		//////////////////////////////////////////////////////////////
		//// 페이징 버튼
		//////////////////////////////////////////////////////////////
		// 페이지 버튼 갯수
		int pageBtnCount = 5;

		// 마지막 버튼 번호
		/*
		<  1   2   3   4   5  >
		1page → (1,5) 	: 올림(1/5)*5 = 0.2(1)*5 : 5
		5page → (1,5) 	: 올림(5/5)*5 = 1.0(1)*5 : 5
		
		<  6   7   8   9   10  >
		6page → (6,10) 	: 올림(6/5)*5 = 1.2(2)*5 : 10
		10page → (6,10) : 올림(10/5)*5 = 2.0(2)*5 : 10
		
		<  11   12   13   14   15  >
		11page → (11,15): 올림(11/5)*5 = 2.2(3)*5 : 15
		15page → (11,15): 올림(15/5)*5 = 3.0(3)*5 : 15
		 */
		int endPageBtnNo = ((int)Math.ceil(crtPage/((double)pageBtnCount)))*pageBtnCount; 

		// 시작 버튼 번호
		int startPageBtnNo = (endPageBtnNo - pageBtnCount) + 1;
		
		// next 버튼 출력여부 결정
		// 전체 글 갯수
		int totalCount = boardRepository.selectTotalCount();
		
		boolean next = false;
		if(listCnt * endPageBtnNo < totalCount) {
			next = true;
		}else { // 마지막 버튼 번호를 다시 계산해야한다.
			//185 일때 19page까지 출력 
			endPageBtnNo = (int)Math.ceil(totalCount/(double)listCnt);
		}
		
		// prev 버튼 출력여부 결정
		boolean prev = false;
		if(startPageBtnNo != 1) {
			prev = true;
		}
		
		// 모두 묶어서 컨트롤러에 리턴해준다.
		Map<String, Object> pMap = new HashMap<String, Object>();
		pMap.put("boardList", boardList); 			// 리스트
		pMap.put("prev", prev);						// 이전버튼 유무
		pMap.put("next", next);						// 다음버튼 유무
		pMap.put("startPageBtnNo", startPageBtnNo);	// 시작번호
		pMap.put("endPageBtnNo", endPageBtnNo);		// 마지막 번호
		
		return pMap;
	}

	// - 게시판 전체리스트3(페이징, 검색)
	public Map<String, Object> exeList3(int crtPage, String kwd) {
		System.out.println("BoardService.exelist3()");

		
		System.out.println(crtPage);
		System.out.println(kwd);
		
		//////////////////////////////////////////////////////////////
		//// 리스트 가져오기
		//////////////////////////////////////////////////////////////
		// - 한페이지의 출력갯수
		int listCnt = 10;
		
		// 시작번호
		int startRowNo = (crtPage-1)*listCnt;
		
		// 두개의 데이터를 묶는다, MAP사용
		Map<String, Object> limitMap = new HashMap<String, Object>();
		limitMap.put("startRowNo", startRowNo); // 시작페이지
		limitMap.put("listCnt", listCnt);		// 출력되는 페이지 수
		limitMap.put("kwd", kwd);				// 키워드
		
		// Repositoryd에게 보낸다
		List<BoardVO> boardList = boardRepository.boardSelectList3(limitMap);

		//////////////////////////////////////////////////////////////
		//// 페이징 버튼
		//////////////////////////////////////////////////////////////
		// 페이지 버튼 갯수
		int pageBtnCount = 5;

		// 마지막 버튼 번호
		int endPageBtnNo = ((int)Math.ceil(crtPage/((double)pageBtnCount)))*pageBtnCount; 

		// 시작 버튼 번호
		int startPageBtnNo = (endPageBtnNo - pageBtnCount) + 1;
		
		// next 버튼 출력여부 결정
		// 전체 글 갯수
		int totalCount = boardRepository.selectTotalCountByKwd(kwd);
		
		boolean next = false;
		if(listCnt * endPageBtnNo < totalCount) {
			next = true;
		}else { // 마지막 버튼 번호를 다시 계산해야한다.
			//185 일때 19page까지 출력 
			endPageBtnNo = (int)Math.ceil(totalCount/(double)listCnt);
		}
		
		// prev 버튼 출력여부 결정
		boolean prev = false;
		if(startPageBtnNo != 1) {
			prev = true;
		}
		
		// 모두 묶어서 컨트롤러에 리턴해준다.
		Map<String, Object> pMap = new HashMap<String, Object>();
		pMap.put("boardList", boardList); 			// 리스트

		pMap.put("prev", prev);						// 이전버튼 유무
		pMap.put("next", next);						// 다음버튼 유무
		pMap.put("startPageBtnNo", startPageBtnNo);	// 시작번호
		pMap.put("endPageBtnNo", endPageBtnNo);		// 마지막 번호
		
		return pMap;
	}
	
	
	
	// - 게시판 등록
	public int exeWrite(BoardVO boardVO) {
		System.out.println("BoardService.exeWrite()");
		
		int count = boardRepository.boardInsert(boardVO);
		
		return count;
	}
	
	// - 게시판 읽기
	public BoardVO exeRead(int no) {
		System.out.println("BoardService.exeread()");
		
		BoardVO boardVO = boardRepository.boardSelectOne(no);
		
		return boardVO;
	}
	
	// - 게시판 수정
	public int exeEdit(BoardVO boardVO) {
		System.out.println("BoardService.exeEdit()");

		int count = boardRepository.boardUpdate(boardVO);

		return count;
	}

	// - 게시판 삭제
	public int exeRemove(BoardVO boardVO) {
		System.out.println("BoardService.exeRomove()");

		int count = boardRepository.boardDelete(boardVO);

		return count;
	}

}
