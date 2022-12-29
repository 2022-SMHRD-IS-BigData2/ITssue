package com.ITssue.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ITssue.dao.CommentsMapper;
import com.ITssue.dao.DiaryMapper;
import com.ITssue.entity.Comments;

public class DeleteCommentCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int cmt_no = Integer.parseInt(request.getParameter("cmt_no"));
		String id = request.getParameter("id");
		System.out.println(cmt_no);
		Comments dto = new Comments();
		dto.setCmt_no(cmt_no);
		dto.setId(id);
		
		
		CommentsMapper dao = new CommentsMapper();
		
		int cnt = dao.deleteComment(dto);
		
		
		if(cnt > 0) {
			response.getWriter().print(true);
		}else {
			response.getWriter().print(false);
			
		}
		
		return null;
	
	}

}
