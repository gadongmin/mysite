package com.javaex.repository;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.javaex.vo.GuestVO;

@SpringBootTest
public class GuestbookRepositoryTest {

	@Autowired
	private GuestbookRepository guestbookRepository;
	/*
	@Test
	public void selectAll() {
		List<GuestVO> guestbookList = guestbookRepository.selectList();
		
		System.out.println("--------------------------");
		System.out.println(guestbookList);
		System.out.println("--------------------------");
		
		assertThat(guestbookList).isNotNull();

	}

	@Test
	public void delete() {
		GuestVO guestVO = new GuestVO();
		guestVO.setNo(2);
		guestVO.setPassword("1");
		System.out.println("--------------------------");
		System.out.println(guestVO);
		System.out.println("--------------------------");
		
		int count = guestbookRepository.deleteGuest(guestVO);
		
		assertThat(count).isEqualTo(0);
	}
	
	@Test
	public void insert() {
		GuestVO guestVO = new GuestVO();
		guestVO.setName("강호동");
		guestVO.setPassword("1");
		guestVO.setContent("안녕");
		System.out.println("--------------------------");
		System.out.println(guestVO);
		System.out.println("--------------------------");
		
		int count = guestbookRepository.insertGuest(guestVO);
		
		assertThat(count).isEqualTo(1);
	}
	*/

}
