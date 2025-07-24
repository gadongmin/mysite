package com.javaex.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.repository.AttachRepository;
import com.javaex.vo.FileVO;

@Service
public class AttachService {
	// 필드
	@Autowired
	private AttachRepository attachRepository;
	
	// 메소드
	public String exeUpload(MultipartFile file) {
		System.out.println("AttachService.exeUpload()");

		// 현재 OS명 확인
		String osName = System.getProperty("os.name").toLowerCase();

		// 저장폴더 위치
		String saveDir = "";
		if(osName.contains("win")){ // 윈도우면
			saveDir = "C:\\javaStudy\\upload\\";
		
		}else{ // 리눅스면
			saveDir = "/data/upload/";	
		}

		
		
		// 1. 파일정보 추출, DB에 저장
		// -가. 오리지널 파일명
		String orgName = file.getOriginalFilename();
		System.out.println(orgName);

		// -나. 확장자
		String exName = orgName.substring(orgName.lastIndexOf(".") + 1);
		System.out.println(exName); // "jpg"
		
		// -다. 저장 파일명(관리용, 덮어쓰기 방지)
		/*
		System.out.println(System.currentTimeMillis()); // 1752549556279 = 기준일로부터 현재시간
		System.out.println(UUID.randomUUID().toString()); // 7d94d163-a619-4e76-9d77-49506b856998 = 랜덤코드
		*/
		String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + "." + exName;
		System.out.println(saveName);

		// -라. 파일 경로
		String filePath = saveDir + saveName;
		System.out.println(filePath);

		// -마. 파일 사이즈
		long fileSize = file.getSize();
		System.out.println(fileSize);

		// -바. VO객체(DB저장용)
		FileVO fileVO = new FileVO(orgName, exName, saveName, filePath, fileSize);
		System.out.println(fileVO);
		
		// -사. DB저장(과제)
		// attachRepository.insert(fileVO);
		
		
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
}
