package com.ITssue.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ITssue.dao.DiaryMapper;
import com.ITssue.entity.Diary;
import com.ITssue.entity.Members;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class DiaryInsertCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String savePath =request.getServletContext().getRealPath("images");
		int maxSize = 5*1024*1024; // 5MB
		
		String encoding = "UTF-8";
	    System.out.println(savePath);
	    
	    // Multipartrequest 생성
	    MultipartRequest multi = new MultipartRequest(
	    		request,
	    		savePath,
	    		maxSize,
	    		encoding,
	    		new DefaultFileRenamePolicy() // 중복된 파일 이름을 변경
	    		);
		
		String title = multi.getParameter("title");
		String file = multi.getFilesystemName("file");
		String content = multi.getParameter("content");
		content = content.replace("\r\n","<br>");
		
		HttpSession session = request.getSession();
		Members info = (Members)session.getAttribute("info");
		String id = info.getId();
		
		Diary dto = new Diary();
		dto.setDiary_title(title);
		dto.setDiary_file(file);
		dto.setDiary_content(content);
		dto.setId(id);
		
		DiaryMapper dao = new DiaryMapper();
		int result = dao.diaryWrite(dto);
		
		String nextPage ="";
		if(result > 0) {
			nextPage="redirect:/goBoardDiary.do";
		}else {
			nextPage="redirect:/goBoardDiary.do";
		}
		
		return nextPage;
	}

}
