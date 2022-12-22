package com.ITssue.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ITssue.entity.Members;
import com.ITssue.entity.Schedule;

public class ScheduleDeleteCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String allDay = request.getParameter("all");
		String startStr =request.getParameter("start");
		String endStr = request.getParameter("end");
		String content = request.getParameter("content");
		
		System.out.println(allDay);
		System.out.println(startStr);
		System.out.println(endStr);
		System.out.println(content);
		
		HttpSession session = request.getSession();
		Members info = (Members)session.getAttribute("info");
		
		Schedule dto = new Schedule();
		dto.setId(info.getId());
		dto.setSche_content(content);
		dto.setSche_e_dt(endStr);
		dto.setSche_s_dt(startStr);
		dto.setScheduel_type(allDay.split("")[0]);
		
		
		
		return null;
	}

}
