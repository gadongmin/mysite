package com.javaex.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.repository.GalleryRepository;
import com.javaex.vo.GalleryVO;

@Service
public class GalleryService {
	// 필드
	@Autowired
	private GalleryRepository galleryRepository;
	
	// 메소드
	public List<GalleryVO> exeList() {
		System.out.println("GalleryService.exeList()");
		
		List<GalleryVO> galleryList = galleryRepository.select();
				
		return galleryList;
	}
	
	public String exeUpload(String content, MultipartFile file, int userNo) {
		System.out.println("GalleryService.exeUpload()");
		// 저장폴더 위치
		String saveDir = "C:\\javaStudy\\upload\\";
		
		// 1. 파일정보 추출, DB에 저장
		// -가. 오리지널 파일명
		String orgName = file.getOriginalFilename();

		// -나. 확장자
		String exName = orgName.substring(orgName.lastIndexOf(".") + 1);
		
		// -다. 저장 파일명(관리용, 덮어쓰기 방지)
		String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + "." + exName;

		// -라. 파일 경로
		String filePath = saveDir + saveName;

		// -마. 파일 사이즈
		long fileSize = file.getSize();

		// -바. VO묶기(DB저장용)
		GalleryVO galleryVO = new GalleryVO();
	    galleryVO.setUserNo(userNo);
		galleryVO.setContent(content);
		galleryVO.setFilePath(filePath);
		galleryVO.setOrgName(orgName);
		galleryVO.setSaveName(saveName);
		galleryVO.setFileSize(fileSize);
				
		// -사. DB저장(과제)
		galleryRepository.insert(galleryVO);
		
		
		// 2. 실제파일을 하드디스크에 저장(스트림 사용)
		try {
			byte[] fileData = file.getBytes();
			
			OutputStream os = new FileOutputStream(filePath);
			BufferedOutputStream bos= new BufferedOutputStream(os);
			
			bos.write(fileData);
			bos.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return saveName;
	}
	
	// - 리스트(1)
	public GalleryVO exeListOne(int no) {
		
		GalleryVO galleryVO = galleryRepository.selectOne(no);
		
		return galleryVO;
	}
	
	// - 삭제
	public boolean exeRemove(int no, int userNo) {
		System.out.println("GalleryService.exeRemove()");
		
		GalleryVO galleryVo = galleryRepository.selectOne(no); 

	    if (galleryVo != null && galleryVo.getUserNo() == userNo) {
			int count = galleryRepository.delete(no);

			return count > 0;

		} else {

			return false;
		}
	}
	
}
