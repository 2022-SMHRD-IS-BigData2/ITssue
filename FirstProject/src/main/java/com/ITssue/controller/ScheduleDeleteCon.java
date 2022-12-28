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
		
		int sche_no = Integer.parseInt(request.getParameter("sche_no"));
		
		
		
		
		
		
		ScheduleMapper dao = new ScheduleMapper();
		int result = dao.sche_delete(sche_no);
		
		if(result > 0) {
			response.getWriter().print("true");
		}else {
			response.getWriter().print("false");
		}
		
		
		return null;
	}

}
