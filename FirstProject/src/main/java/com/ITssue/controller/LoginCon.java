package com.ITssue.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ITssue.dao.MembersMapper;
import com.ITssue.entity.Members;

public class LoginCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		Members dto = new Members();
		dto.setId(id);
		dto.setPw(pw);
		
		MembersMapper dao = new MembersMapper();
		Members result = dao.login(dto);
		
		if(result != null) {
			HttpSession session = request.getSession();
			session.setAttribute("info", result);
			response.getWriter().print(true);
		}else {
			response.getWriter().print(false);
		}
		
		
		return null;
	}

}
