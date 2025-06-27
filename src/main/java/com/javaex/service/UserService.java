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

	public String exeEdit() {

		return "";

	}

}
