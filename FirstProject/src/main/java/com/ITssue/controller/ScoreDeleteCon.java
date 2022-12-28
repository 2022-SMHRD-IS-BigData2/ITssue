package com.ITssue.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ITssue.dao.ScoreMapper;

public class ScoreDeleteCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		int scoreNo = Integer.parseInt(request.getParameter("scoreNo"));
		
		ScoreMapper dao = new ScoreMapper();
		int result = dao.scoreDelte(scoreNo);
		if(result > 0) {
			response.getWriter().print(true);
		}else {
		}
		
		
		
		return null;
	}

}
