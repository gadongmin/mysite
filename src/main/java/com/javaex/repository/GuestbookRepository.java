package com.javaex.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.GuestVO;

@Repository
public class GuestbookRepository {
	@Autowired
	private SqlSession sqlSession;
	
	public List<GuestVO> selectList() {
		System.out.println("GuestbookRepository.selectList()");

		List<GuestVO> gList = sqlSession.selectList("guest.selectList");
		
		return gList;
	}
	
	public GuestVO selectOne(int no) {
		System.out.println("GuestbookRepository.selectOne()");
		System.out.println(no);
		
		GuestVO guestVO = sqlSession.selectOne("guest.selectOne", no);
		
		return guestVO;
	}
	
	public int insertGuest(GuestVO guestVO) {
		System.out.println("GuestbookRepository.insertGuest()");
		
		int count = sqlSession.insert("guest.insert",guestVO);
		
		return count;
	}
	
	public int insertKeyGuest(GuestVO guestVO) {
		System.out.println("GuestbookRepository.insertKeyGuest()");

		// System.out.println(guestVO); // 3개
		int count = sqlSession.insert("guest.insertKey",guestVO);
		// System.out.println(guestVO); // 4개 (no값 추가)

		return count;
	}

	
	public int deleteGuest(GuestVO guestVO) {
		System.out.println("GuestbookRepository.deleteGuest()");
		
		int count = sqlSession.delete("guest.delete",guestVO);
		
		return count;
	}
	
}
