package com.javaex.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.service.AttachService;
import com.javaex.service.GalleryService;
import com.javaex.vo.GalleryVO;
import com.javaex.vo.UserVO;

import jakarta.servlet.http.HttpSession;

@Controller
public class GalleryController {

	private final AttachService attachService;
	// 필드
	@Autowired
	private GalleryService galleryService;

	GalleryController(AttachService attachService) {
		this.attachService = attachService;
	}

	// 메소드
	// - 전체 리스트
	@GetMapping("/gallery/list")
	public String list(Model model) {
		System.out.println("GalleryController.list()");

		List<GalleryVO> galleryList = galleryService.exeList();
		model.addAttribute("gList", galleryList);

		return "gallery/list";
	}

	// - 파일 업로드
	@PostMapping("/gallery/upload")
	public String upload(@RequestParam(value = "content") String content,
			@RequestParam(value = "file") MultipartFile file, HttpSession session) {
		System.out.println("GalleryController.upload()");

		UserVO authUser = (UserVO) session.getAttribute("authUser");

		if (authUser == null) {
			return "redirect:/user/loginform";
		}

		int userNo = authUser.getNo();
		galleryService.exeUpload(content, file, userNo);

		return "redirect:/gallery/list";
	}

	// - 리스트(1)
    @ResponseBody
    @GetMapping("/gallery/read/{no}")
    public GalleryVO read(@PathVariable("no") int no) {
        System.out.println("GalleryController.read()");
        
        GalleryVO galleryVO = galleryService.exeListOne(no); 
        
        return galleryVO;
    }

    // - 삭제
    @ResponseBody
    @DeleteMapping("/gallery/remove/{no}")
    public Map<String, Object> remove(@PathVariable("no") int no, HttpSession session) {
        System.out.println("GalleryController.remove()");

        Map<String, Object> response = new HashMap<>();
        UserVO authUser = (UserVO) session.getAttribute("authUser");

        if (authUser == null) {
            response.put("result", "fail");
            return response;
        }

        int userNo = authUser.getNo();
        boolean isSuccess = galleryService.exeRemove(no, userNo);
        
        if (isSuccess) {
            response.put("result", "success");
        } else {
            response.put("result", "fail");
        }
        return response;
    }
}
