package com.ITssue.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ITssue.dao.CommentsMapper;
import com.ITssue.entity.Comments;

public class WriteCommentCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String comment =request.getParameter("comment");
		String id = request.getParameter("id");
		
		CommentsMapper dao = new CommentsMapper();
		
		System.out.println("boardNo :"+boardNo);
		System.out.println("comment : "+comment);
		System.out.println("id :"+id);
		
		
		Comments dto = new Comments();
		dto.setBoard_no(boardNo);
		dto.setCmt_content(comment);
		dto.setId(id);
		
      int result = dao.commentWrite(dto);
		
		if(result > 0) {
			response.getWriter().print("true");
			System.out.println("등록성공");
		}else {
			response.getWriter().print("false");
			System.out.println("등록실패");
		}
		
		return null;
		
	}

}
