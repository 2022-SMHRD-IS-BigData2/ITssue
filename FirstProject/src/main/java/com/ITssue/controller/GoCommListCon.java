package com.ITssue.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ITssue.dao.BoardMapper;
import com.ITssue.entity.Board;

public class GoCommListCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		BoardMapper dao = new BoardMapper();
		List<Board> list = dao.boardList();
		List<Board> rank = dao.boardRank();
		
		
		request.setAttribute("boardList", list);
		request.setAttribute("boardRank", rank);
		
		return "commBoardList";
	}

}
