package com.javaex.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.FileVO;

@Repository
public class AttachRepository {
	// 필드
	@Autowired
	private SqlSession sqlSession;
	
	// 메소드
	public void insert(FileVO fileVO) {
		System.out.println("AttachRepository.insert()");
		
		sqlSession.insert("attach.insert", fileVO);
	}
	
}
