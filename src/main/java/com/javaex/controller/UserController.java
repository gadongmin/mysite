package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.UserService;
import com.javaex.vo.UserVO;

import jakarta.servlet.http.HttpSession;


@Controller
public class UserController {
	// 필드
	@Autowired
	private UserService userService;

	// 메소드 일반
	// - 회원가입폼
	@RequestMapping(value = "/user/joinform", method = { RequestMethod.GET, RequestMethod.POST })
	public String joinForm() {
		System.out.println("UserController.joinform()");

		return "user/joinform";
	}

	// - 회원가입
	@RequestMapping(value = "/user/join", method = { RequestMethod.GET, RequestMethod.POST })
	public String join(@ModelAttribute UserVO userVO) {
		System.out.println("UserController.join()");
		System.out.println(userVO);

		try {
			userService.exeJoin(userVO);
			return "user/joinok";

		} catch (DuplicateKeyException e) {
			System.out.println(e);
			System.out.println("중복아이디");
			return "user/joinform";

		} catch (Exception e) {
			System.out.println(e);
			return "user/joinform";
		}

	}
	
	// - 회원가입 아이디 중복체크 → 데이터만 응답
	@ResponseBody
	@RequestMapping(value = "/user/idcheck", method = {RequestMethod.GET, RequestMethod.POST})
	public String idcheck(@RequestParam(value="id") String id, Model model) {
		System.out.println("UserController.idcheck()");
		
		boolean isUse = userService.exeIdcheck(id);
		System.out.println(isUse);
		
		// jsp에 전달할때(기존방식, model에 담으면 jsp를 꺼내서 공식응답문서를 만든다.)
		// model.addAttribute("isUse", isUse);
		
		// json형식으로 데이터 전송(@ResponseBody 상단에 붙이고 return으로 보낸다.)
		String result = "{\"isUse\": "+isUse+"}";
		
		return result;
	}

	// - 회원가입 완료
	@RequestMapping(value = "/user/joinok", method = { RequestMethod.GET, RequestMethod.POST })
	public String joinOk() {
		System.out.println("UserController.joinok()");

		return "user/joinok";
	}

	// - 로그인폼
	@RequestMapping(value = "/user/loginform", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginForm() {
		System.out.println("UserController.loginForm()");
		
		return "user/loginform";
	}

	// - 로그인
	@RequestMapping(value = "/user/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(@ModelAttribute UserVO userVO, HttpSession session) {
		System.out.println("UserController.login()");
		
		UserVO authUser = userService.exeLogin(userVO);

		// -- 세션에 로그인 확인용 값을 넣어준다 → 로그인
		session.setAttribute("authUser", authUser);
		
		return "redirect:/";
	}
	
	// - 로그아웃
	@RequestMapping(value = "/user/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) {
		System.out.println("UserController.logout()");
		
		// -- 세션의 로그인 확인용 값을 지워준다 → 로그아웃
		//session.removeAttribute("authUser"); 	// 지정된 대상만 로그아웃 
		session.invalidate(); 					// 전체인원 로그아웃
		
		return "redirect:/";
	}

	// 회원정보수정폼
	@RequestMapping(value = "/user/editform", method = { RequestMethod.GET, RequestMethod.POST })
	public String editForm(HttpSession session, Model model) {
		System.out.println("UserController.editform()");
		
		// 세션에 값이 있는지 여부확인.
		UserVO authUser = (UserVO)session.getAttribute("authUser");
		
		if(authUser == null) {
			return "redirect:/user/loginform";
		
		}else {
			// 세션에서 "no"값(로그인된 사용자의 정보)을 가져온다.
			int no = authUser.getNo();
			
			//"no"값을 서비스에 넘겨서 no회원의 정보를 userVO형태로 받는다.
			UserVO userVO = userService.exeEditData(no);
			
			//userVO모델에 담는다.(DS에게 명령, reqest에 어트리뷰트에 넣어)
			model.addAttribute("userVO", userVO);

			return "user/editform";
		}
	}

	// 회원정보수정
	@RequestMapping(value = "/user/edit", method = { RequestMethod.GET, RequestMethod.POST })
	public String edit(@ModelAttribute UserVO userVO, HttpSession session) {
		System.out.println("UserController.edit()");
		
		// 세션에서 "no"값(로그인된 사용자의 정보)을 가져온다.
		UserVO authUser = (UserVO)session.getAttribute("authUser");
		int no = authUser.getNo();
		
		// DS가 묶어준 userVO에 세견에서 꺼낸 no를 추가한다.
		userVO.setNo(no);
		
		// 서비스에 묶어둔 userVO를 넘긴다.
		userService.exeEdit(userVO);
		
		// 해더의 이름 변경(세션안에 있는 정보)
		// 위에서 가져온 authUser에 이름을 변경한다.
		authUser.setName(userVO.getName());
		
		// 메인으로 리다이렉트 시킨다.
		return "redirect:/";
	}
}
