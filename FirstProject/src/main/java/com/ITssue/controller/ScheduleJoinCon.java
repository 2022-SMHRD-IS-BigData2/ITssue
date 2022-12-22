package com.ITssue.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ITssue.dao.ScheduleMapper;
import com.ITssue.entity.Members;
import com.ITssue.entity.Schedule;

public class ScheduleJoinCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	
		String allDay = request.getParameter("all");
		String startStr =request.getParameter("start");
		String endStr = request.getParameter("end");
		String content = request.getParameter("content");
		
		HttpSession session = request.getSession();
		Members info = (Members)session.getAttribute("info");
		
		Schedule dto = new Schedule();
		dto.setId(info.getId());
		dto.setSche_content(content);
		dto.setSche_e_dt(endStr);
		dto.setSche_s_dt(startStr);
		dto.setScheduel_type(allDay.split("")[0]);
		
		ScheduleMapper dao = new ScheduleMapper();
		int result = dao.sche_in(dto);
		
		if(result > 0) {
			response.getWriter().print("true");
		}else {
			response.getWriter().print("false");
		}
		
		
		return null;
	}

}
