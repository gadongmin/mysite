package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.service.UserService;
import com.javaex.vo.UserVO;

@Controller
public class UserController {
	// 필드
	@Autowired
	private UserService userService;
	
	// 메소드 일반
	// - 회원가입
	@RequestMapping(value = "/user/joinform", method = { RequestMethod.GET, RequestMethod.POST })
	public String joinForm(@ModelAttribute UserVO userVO) {
		System.out.println("UserController.joinForm()");
		System.out.println(userVO);

		 userService.exeJoin(userVO);

		return "redirect:/user/joinok";

	}
	
	// - 회원가입 완료
	@RequestMapping(value = "/user/joinok", method = { RequestMethod.GET, RequestMethod.POST })
	public String joinOk() {
		System.out.println("UserController.joinok()");

		return "user/joinok";

	}
}
