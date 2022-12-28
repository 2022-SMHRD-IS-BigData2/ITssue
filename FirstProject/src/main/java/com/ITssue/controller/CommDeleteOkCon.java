package com.ITssue.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ITssue.dao.BoardMapper;

public class CommDeleteOkCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int board_no = Integer.parseInt(request.getParameter("board_no"));
		
		
		
		BoardMapper dao = new BoardMapper();
		
		int cnt = dao.deleteBoard(board_no);
		
		if(cnt > 0) {
			response.getWriter().print(true);
		}else {
			response.getWriter().print(false);
			
		}
		
		return null;
	}

}
