package com.ITssue.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ITssue.dao.ScheduleMapper;
import com.ITssue.entity.Schedule;

public class ScheduleUdateCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String all = request.getParameter("all");
		int sche_no = Integer.parseInt(request.getParameter("sche_no"));
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		
		
		System.out.println(all.split("")[0]);
		System.out.println(sche_no);
		System.out.println(start);
		System.out.println(end);
		all = all.split("")[0];
		
		Schedule dto = new Schedule();
		
		dto.setScheduel_type(all);
		dto.setSche_no(sche_no);
		dto.setSche_s_dt(start);
		
		if(all.equals("t")) {
			dto.setSche_e_dt(start);
		}else {
			dto.setSche_e_dt(end);
		}
		
		ScheduleMapper dao = new ScheduleMapper();
		int result = dao.sche_update(dto);
		
		if(result > 0) {
			response.getWriter().print("true");
			System.out.println("업데이트 성공");
			
		}else {
			response.getWriter().print("false");
			System.out.println("업데이트 실패");
		}
		
		
		
		
		return null;
	}

}
