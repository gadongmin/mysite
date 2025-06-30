package com.javaex.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.UserVO;

@Repository
public class UserRepository {
	// 필드
	@Autowired
	private SqlSession sqlSession;

	// 메소드 일반
	public void userSelectOne() {
	}

	// - 회원가입
	public int userInsert(UserVO userVO) {
		System.out.println("UserRepository.userInsert()");

		int count = sqlSession.insert("user.insert", userVO);

		return count;
	}
	
	// - 로그인
	public UserVO userSelectOneByIdPw(UserVO userVO) {
		System.out.println("UserRepository.userSelectOneByIdPw()");
		System.out.println(userVO + "login"); //ID, PW 입력받아 요청
		
		UserVO authUser = sqlSession.selectOne("user.selectOneByIdPw", userVO);
		System.out.println(authUser); // 로그인 요청된 인원의 모든정보
		
		return authUser;
	}
	
	//회원정보 수정폼
	public UserVO userSelectOneByNo(int no) {
		System.out.println("UserRepository.userSelectOne()");
		
		UserVO userVO = sqlSession.selectOne("user.selectOneByNo",no);
		System.out.println(userVO + "editform");
		
		return userVO;
		
	}
	
	//회원정보 수정
	public int userUpdate(UserVO userVO) {
		System.out.println("UserRepository.userUpdate()");

		int count = sqlSession.update("user.update",userVO);
		System.out.println(userVO + "edit");
		
		return count;
		
	}
	
	
}
