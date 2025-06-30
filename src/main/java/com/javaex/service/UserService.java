package com.javaex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.repository.UserRepository;
import com.javaex.vo.UserVO;

@Service
public class UserService {
	// 필드
	@Autowired
	private UserRepository userRepository;
	
	// 메소드 일반
	// - 회원가입
	public int exeJoin(UserVO userVO) {
		System.out.println("UserService.exeJoin()");

		int count = userRepository.userInsert(userVO);

		return count;

	}
	// - 로그인(user정보 가져오기, idpw)
	public UserVO exeLogin(UserVO userVO) {
		System.out.println("UserService.exeLogin()");

		UserVO authUser = userRepository.userSelectOneByIdPw(userVO);
		
		return authUser;

	}
	
	//회원정보 수정(user정보 가져오기, no)
	public UserVO exeEditData(int no) {
		System.out.println("UserService.exeEditData()");
		
		UserVO userVO = userRepository.userSelectOneByNo(no);
		
		return userVO;

	}
	
	//회원정보 수정
	public int exeEdit(UserVO userVO) {
		System.out.println("UserService.exeEdit()");
		
		int count = userRepository.userUpdate(userVO);

		return count;

	}

}
