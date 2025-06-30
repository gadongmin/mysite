package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.repository.GuestbookRepository;
import com.javaex.vo.GuestVO;

@Service
public class GuestbookService {
	@Autowired
	private GuestbookRepository guestbookRepository;
	
	public List<GuestVO> exeList() {
		System.out.println("guestbookService.exeAddList()");
		
		List<GuestVO> gList = guestbookRepository.selectList();

		return gList;
		
	}
	
	public int exeAdd(GuestVO guestVO) {
		System.out.println("GuestbookService.exeAdd()");
		
		int count = guestbookRepository.insertGuest(guestVO);
		
		return count;
		
	}
	
	public int exeRemove(GuestVO guestVO) {
		System.out.println("GuestbookService.exeRemove()");
		
		int count = guestbookRepository.deleteGuest(guestVO);
		
		return count;
		
	}
}
