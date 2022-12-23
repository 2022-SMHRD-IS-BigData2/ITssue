package com.ITssue.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ITssue.dao.Study_timeMapper;
import com.ITssue.entity.Study_time;

public class StudyTimePlusCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String time = request.getParameter("time");
		String plusTime = time.split("\\.")[0];
		System.out.println(plusTime);
		
		Study_time dto = new Study_time();
		dto.setId(id);
		dto.setStudy_e_time(plusTime);
		dto.setAmounts(plusTime);
		
		
		
		Study_timeMapper dao = new Study_timeMapper();
		int result = dao.timePlus(dto);
		
		if(result > 0) {
			response.getWriter().print("true");
		}else {
			response.getWriter().print("false");
		}
		
		return null;
	}

}
