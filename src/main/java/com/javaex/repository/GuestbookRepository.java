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
		System.out.println("guestbookRepository.selectList()");

		List<GuestVO> gList = sqlSession.selectList("guest.selectList");
		
		return gList;
		
	}
	
	public int insertGuest(GuestVO guestVO) {
		System.out.println("uestbookRepository.insertGuest()");
		
		int count = sqlSession.insert("guest.insert",guestVO);
		
		return count;
	}

	
	public int deleteGuest(GuestVO guestVO) {
		System.out.println("guestbookRepository.deleteGuest()");
		
		int count = sqlSession.delete("guest.delete",guestVO);
		
		return count;
	}
	
}
