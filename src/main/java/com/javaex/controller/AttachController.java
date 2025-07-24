package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.service.AttachService;



@Controller
public class AttachController {
	// 필드
	@Autowired
	private AttachService attachService;
	
	// 메소드
	// - 파일 업로드 폼
	@RequestMapping(value = "/attach/form", method = { RequestMethod.GET, RequestMethod.POST })
	public String form() {
		System.out.println("AttachController.form()");

		return "attach/form";
	}
	
	
	// -  파일 업로드
	@RequestMapping(value = "/attach/upload", method = { RequestMethod.GET, RequestMethod.POST })
	public String upload(@RequestParam(value="file") MultipartFile file, Model model) {
		System.out.println("AttachController.upload()");

		String saveName = attachService.exeUpload(file);
		
		model.addAttribute("saveName", saveName);
		
		return "attach/result";
	}
	
	
	// - 파일 업로드 결과
	@RequestMapping(value = "/attach/result", method = { RequestMethod.GET, RequestMethod.POST })
	public String result() {
		System.out.println("AttachController.result()");
		
		return "attach/result";
	}
}
