package com.ITssue.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ITssue.dao.Study_timeMapper;
import com.ITssue.entity.Study_time;

public class StudyTimeGetCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String amounts = request.getParameter("amounts");
		System.out.println(amounts);
		
		Study_time dto = new Study_time();
		dto.setAmounts(amounts);
		
		Study_timeMapper dao = new Study_timeMapper();
		List<Study_time> result = dao.timeGet(dto);
		
		if(result == null) {
			System.out.println("조회 실패!!");
		}else {
			System.out.println("조회 성공...");
		}	// 세션에 사용자 정보 저장
			HttpSession session = request.getSession();
			session.setAttribute("get", result);
		
						
		return "META-INF/myboardtime.jsp";
	}

}
