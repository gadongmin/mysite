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
	
	public GuestVO exeAddKey(GuestVO guestVO) {
		System.out.println("GuestbookService.exeAddKey()");
		
		int no = guestbookRepository.insertKeyGuest(guestVO);
		
		// 추가된 no로 방명록 글 가져오기
		GuestVO gVO = guestbookRepository.selectOne(guestVO.getNo());
		
		return gVO;
		
	}
	
	public int exeRemove(GuestVO guestVO) {
		System.out.println("GuestbookService.exeRemove()");
		
		int count = guestbookRepository.deleteGuest(guestVO);
		
		return count;
		
	}
}
