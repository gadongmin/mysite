package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.GuestbookService;
import com.javaex.vo.GuestVO;

@Controller
public class GuestbookApiController {
	// 필드
	@Autowired
	private GuestbookService guestbookService;
	
	// 메소드
	// - 전체리스트
	@ResponseBody
	@RequestMapping(value="/api/guestbook/list", method = {RequestMethod.GET, RequestMethod.POST})
	public List<GuestVO> list() {
		System.out.println("GuestbookApiController.list()");
		
		List<GuestVO> guestbookList= guestbookService.exeList();
		System.out.println(guestbookList);
		
		return guestbookList;
	}
	
	// - 등록 
	@ResponseBody
	@RequestMapping(value ="/api/guestbook/add", method = {RequestMethod.GET, RequestMethod.POST})
	public GuestVO add(@ModelAttribute GuestVO guestVO) {
		System.out.println("GuestbookApiController.add()");
		
		// guestVO(3개) 보내서 guestVO(4개, no포함) 받아서 화면으로 보낸다.  
		GuestVO gVO = guestbookService.exeAddKey(guestVO);
		
		return gVO;
	}

	// - 삭제
	@ResponseBody
	@RequestMapping(value = "/api/guestbook/remove", method = {RequestMethod.GET, RequestMethod.POST})
	public int remove(@ModelAttribute GuestVO guestVO) {
		System.out.println("GuestbookController.remove()");

		int count = guestbookService.exeRemove(guestVO);
		
		return count;
	}
}
