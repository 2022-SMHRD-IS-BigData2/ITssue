package com.ITssue.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ITssue.dao.BoardMapper;
import com.ITssue.entity.Board;
import com.google.gson.Gson;

public class BoardListCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		BoardMapper dao = new BoardMapper();
		List<Board> list = dao.boardList();
		
		
		request.setAttribute("boardList", list);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		Gson gson = new Gson();
		String json = gson.toJson( list );
		out.print(json);
		
		return null;
	}

}
