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

	@Autowired
	private UserService serService;

	@RequestMapping(value = "/user/joinform", method = { RequestMethod.GET, RequestMethod.POST })
	public String joinForm(@ModelAttribute UserVO userVO) {
		System.out.println("UserController.joinForm()");
		System.out.println(userVO);

		serService.exeJoin(userVO);

		return "redirect:/user/joinok";

	}

	@RequestMapping(value = "/user/joinok", method = { RequestMethod.GET, RequestMethod.POST })
	public String joinOk() {
		System.out.println("UserController.joinok()");

		return "user/joinok";

	}
}
