package com.ITssue.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ITssue.dao.BoardMapper;
import com.ITssue.dao.LikesMapper;
import com.ITssue.entity.Board;
import com.ITssue.entity.Likes;
import com.google.gson.Gson;

public class LikeCheckCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		int boardNo = Integer.parseInt(request.getParameter("board"));
		String id = request.getParameter("id");
		
		Likes dto = new Likes();
		
		dto.setBoard_no(boardNo);
		dto.setId(id);
		
		LikesMapper dao = new LikesMapper();
		Likes check = dao.likeCheck(dto);
		
		int result = 0;
		BoardMapper boardDao = new BoardMapper();
		if(check != null) {
			// 이미 추천을 한 경우
			result = dao.likeDelete(dto);
			boardDao.likeMinus(boardNo);
		}else {
			// 추천을 하지 않은 경우
			result = dao.likeInsert(dto);
			boardDao.likePlus(boardNo);
		}
		
		
		Board boardInfo = null;
		if(result > 0) {
			boardInfo = boardDao.boardInfo(boardNo);
		}else {
		}
		
		Gson gson = new Gson();
		String json = gson.toJson(boardInfo);
		
		response.getWriter().print(json);
		
		
		return null;
	}

}
