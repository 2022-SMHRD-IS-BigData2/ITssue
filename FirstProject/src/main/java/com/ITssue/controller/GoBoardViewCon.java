package com.ITssue.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ITssue.dao.BoardMapper;
import com.ITssue.entity.Board;

public class GoBoardViewCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

        int num = Integer.parseInt(request.getParameter("num"));
		
		// DAO의 boardView 사용
		BoardMapper dao = new BoardMapper();
		
		Board board =  dao.boardView( num );
		
		HttpSession session = request.getSession();
		session.setAttribute("boardinfo", board);
		
		return "viewCommBoard";
	}

}
