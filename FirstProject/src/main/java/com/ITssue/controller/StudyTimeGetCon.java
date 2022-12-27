package com.ITssue.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ITssue.dao.Study_timeMapper;
import com.ITssue.entity.Members;
import com.ITssue.entity.Study_time;

public class StudyTimeGetCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		Members info = (Members)session.getAttribute("info");
		
		Study_timeMapper dao = new Study_timeMapper();
		List<Study_time> result = dao.timeGet(info.getId());
		
		if(result == null) {
			System.out.println("조회 실패!!");
		}else {
			System.out.println("조회 성공...");
			session.setAttribute("get", result);
		}	// 세션에 사용자 정보 저장
//		System.out.println(result.get(0));
//		System.out.println(result.get(0).getAmounts().split(":")[0]);
//		System.out.println(result.get(0).getAmounts().split(":")[1]);
//		System.out.println(result.get(0).getAmounts().split(":")[2]);



		return "myboardtime.jsp";
	}

}
