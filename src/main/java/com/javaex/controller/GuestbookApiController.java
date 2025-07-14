package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.javaex.service.GuestbookService;
import com.javaex.util.JsonResult;
import com.javaex.vo.GuestVO;

@RestController
// @Controller + @ResponseBody
public class GuestbookApiController {
	// 필드
	@Autowired
	private GuestbookService guestbookService;
	
	// 메소드
	// - 전체리스트
	// @ResponseBody
	@GetMapping("/api/guestbooks")
	// @GetMapping(value="/api/guestbooks")
	// @RequestMapping(value="/api/guestbooks", method = RequestMethod.GET)
	public JsonResult list() {
		System.out.println("GuestbookApiController.list()");
		
		List<GuestVO> guestbookList= guestbookService.exeList();
		System.out.println(guestbookList);

		if(guestbookList != null) {
			return JsonResult.success(guestbookList);	
		}else {
			return JsonResult.fail("알 수 없는 오류");
		}
	}
	
	// - 등록 
	// @ResponseBody
	@PostMapping("/api/guestbooks")
	// @PostMapping(value ="/api/guestbooks")
	// @RequestMapping(value ="/api/guestbooks", method = RequestMethod.POST)
	public JsonResult add(@ModelAttribute GuestVO guestVO) {
		System.out.println("GuestbookApiController.add()");
		
		// guestVO(3개) 보내서 guestVO(4개, no포함) 받아서 화면으로 보낸다.  
		GuestVO gVO = guestbookService.exeAddKey(guestVO);
		
		if(gVO != null) {
			return JsonResult.success(gVO);	
		}else {
			return JsonResult.fail("저장 실패");
		}
	}

	// - 삭제
	// @ResponseBody
	@DeleteMapping("/api/guestbooks/{no}")
	// @DeleteMapping(value = "/api/guestbooks/{no}")
	// @RequestMapping(value = "/api/guestbooks/{no}", method = RequestMethod.DELETE)
	public JsonResult remove(@ModelAttribute GuestVO guestVO
					  ,@PathVariable(value = "no") int no
					  ) {
		System.out.println("GuestbookController.remove()");
		// guestVO에 password 값만 있음
		System.out.println(guestVO);
		System.out.println("PathVariable로 받은 값 : "+no);

		// guestVO에 no 값을 추가
		guestVO.setNo(no);

		int count = guestbookService.exeRemove(guestVO);
		System.out.println(count);
		if(count == 1) {
			return JsonResult.success(count); 
		}else {
			return JsonResult.fail("패스워드 오류");
		}
	}
}
