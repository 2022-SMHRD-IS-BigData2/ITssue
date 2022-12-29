package com.ITssue.controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ITssue.dao.MembersMapper;
import com.ITssue.entity.Members;

public class JoinCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String birth = request.getParameter("birth");
		String nick = request.getParameter("nick");
		
		
		if(birth.equals("")) {
			LocalDate now = LocalDate.now();
			
			int nowYear = now.getYear();
			int nowMonth = now.getMonthValue();
			int nowDay = now.getDayOfMonth();
			
			birth = nowYear+"-"+nowMonth+"-"+nowDay;
		}

		Members dto = new Members();
		dto.setId(id);
		dto.setPw(pw);
		dto.setBirth(birth);
		dto.setNick(nick);
		
		
		MembersMapper dao = new MembersMapper();
		int result = dao.join(dto);
		
		if(result > 0) {
			response.getWriter().print(true);
		}else {
			response.getWriter().print(false);
		}
		
		
		return null;
	}

}
