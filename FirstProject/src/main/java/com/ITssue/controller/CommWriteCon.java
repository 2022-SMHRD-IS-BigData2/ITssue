package com.ITssue.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ITssue.dao.BoardMapper;
import com.ITssue.entity.Board;
import com.ITssue.entity.Members;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class CommWriteCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
        String savePath =request.getServletContext().getRealPath("images");
		
		//최대 사이즈
		 // byte 단위
		int maxSize = 5*1024*1024; // 5MB
		
		// 인코딩 방식
	    String encoding = "UTF-8";
	    
	    // Multipartrequest 생성
	    MultipartRequest multi = new MultipartRequest(
	    		request,
	    		savePath,
	    		maxSize,
	    		encoding,
	    		new DefaultFileRenamePolicy() // 중복된 파일 이름을 변경
	    		);
		
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String hashtag = multi.getParameter("hashtag");
		String file = multi.getFilesystemName("file"); 
		content = content.replace("\r\n","<br>");
		
		
		HttpSession session = request.getSession();
		Members info = (Members)session.getAttribute("info");
		String id = info.getId();
		
		Board dto = new Board();
		dto.setBoard_title(title);
		dto.setBoard_content(content);
		dto.setHash_tag(hashtag);
		dto.setId(id);
		dto.setBoard_file(file);
		
		BoardMapper dao = new BoardMapper();
		int result = dao.boardWrite(dto);
		
		if(result > 0) {
			response.getWriter().print("true");
		}else {
			response.getWriter().print("false");
		}
		
		return null;
	}

}
