package com.ITssue.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ITssue.dao.BoardMapper;
import com.ITssue.entity.Board;
import com.ITssue.entity.Members;

public class CommWriteCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String hashtag = request.getParameter("hashtag");
		
		HttpSession session = request.getSession();
		Members info = (Members)session.getAttribute("info");
		String id = info.getId();
		
		Board dto = new Board();
		dto.setBoard_title(title);
		dto.setBoard_content(content);
		dto.setHash_tag(hashtag);
		dto.setId(id);
		dto.setBoard_file("");
		
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
