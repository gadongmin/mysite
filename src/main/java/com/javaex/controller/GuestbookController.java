package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.service.GuestbookService;
import com.javaex.vo.GuestVO;

@Controller
public class GuestbookController {
	
	@Autowired
	private GuestbookService guestbookService;
	
	@RequestMapping(value="/guestbook/addlist", method = {RequestMethod.GET, RequestMethod.POST})
	public String addList(Model model) {
		System.out.println("GuestbookController.addList()");
		
		List<GuestVO> gList = guestbookService.exeList();
		
		model.addAttribute("gList",gList);
		
		return "/guestbook/addlist";
	}
	
	@RequestMapping(value = "/guestbook/add", method = {RequestMethod.GET, RequestMethod.POST})
	public String add(@ModelAttribute GuestVO guestVO) {
		System.out.println("guestbookService.add()");
		System.out.println(guestVO);
		
		guestbookService.exeAdd(guestVO);
		
		return "redirect:/guestbook/addlist";
	}

	@RequestMapping(value = "/guestbook/removeform", method = {RequestMethod.GET, RequestMethod.POST})
	public String removeForm() {
		System.out.println("guestbookService.removeForm()");
		
		
		return "/guestbook/removeform";
	}

	@RequestMapping(value = "/guestbook/remove", method = {RequestMethod.GET, RequestMethod.POST})
	public String remove(@ModelAttribute GuestVO guestVO) {
		System.out.println("guestbookService.remove()");
		
		guestbookService.exeRemove(guestVO);
		
		return "redirect:/guestbook/addlist";
	}
}
