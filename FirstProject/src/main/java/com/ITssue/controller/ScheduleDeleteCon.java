package com.ITssue.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ITssue.dao.ScheduleMapper;
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
		
		System.out.println();
		System.out.println("allDay:"+allDay);
		System.out.println("startStr"+startStr);
		System.out.println("endStr"+endStr);
		System.out.println("content"+content);
		
		HttpSession session = request.getSession();
		Members info = (Members)session.getAttribute("info");
		
		Schedule dto = new Schedule();
		dto.setId(info.getId());
		dto.setSche_content(content);
		dto.setScheduel_type(allDay.split("")[0]);
		if(dto.getScheduel_type().equals("t")) {
			dto.setSche_e_dt(endStr+"00:00:00");
			dto.setSche_s_dt(startStr+"00:00:00");
		}else {
			dto.setSche_e_dt(endStr);
			dto.setSche_s_dt(startStr);
		}
		
		System.out.println();
		System.out.println("sche_s_dt:"+dto.getSche_s_dt());
		System.out.println("sche_e_dt:"+dto.getSche_e_dt());
		System.out.println("id:"+dto.getId());
		System.out.println("scheduel_type:"+dto.getScheduel_type());
		System.out.println("sche_content:"+dto.getSche_content());
		
		
		
		ScheduleMapper dao = new ScheduleMapper();
		int result = dao.sche_delete(dto);
		
		System.out.println(result +"개 삭제 성공");
		if(result > 0) {
			System.out.println("삭제성공");
			response.getWriter().print("true");
		}else {
			System.out.println("삭제실패");
			response.getWriter().print("false");
		}
		
		
		return null;
	}

}
