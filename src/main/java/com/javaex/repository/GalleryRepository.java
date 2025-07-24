package com.javaex.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.GalleryVO;

@Repository
public class GalleryRepository {
	// 필드
	@Autowired
	private SqlSession sqlSession;

	// 메소드
	// - 전체리스트
	public List<GalleryVO> select() {
		System.out.println("GalleryRepository.select()");

		List<GalleryVO> galleryList = sqlSession.selectList("gallery.selectList");

		return galleryList;
	}
	
	// - 등록
	public void insert(GalleryVO galleryVO) {
		System.out.println("GalleryRepository.insert()");

		sqlSession.insert("gallery.insert", galleryVO);
	}
	
	// - 리스트
	public GalleryVO selectOne(int no) {
		System.out.println("GalleryRepository.selectOne()");
		
		GalleryVO galleryVO = sqlSession.selectOne("gallery.selectOne", no); 
		System.out.println(galleryVO);
		return galleryVO;
	}

	// - 삭제
	public int delete(int no) {
		System.out.println("GalleryRepository.delete()");
		
		int count = sqlSession.delete("gallery.delete", no); 
		System.out.println(count);
		
		return count;
	}
}