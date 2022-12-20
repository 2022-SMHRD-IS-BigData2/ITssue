package com.ITssue.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ITssue.dao.MembersMapper;
import com.ITssue.entity.Members;

@WebServlet("/AjaxCon")
public class AjaxCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String birth = request.getParameter("birth");
		String nick = request.getParameter("nick");
		
		Members dto = new Members();
		dto.setId(id);
		dto.setPw(pw);
		dto.setBirth(birth);
		dto.setNick(nick);
		
		
		MembersMapper dao = new MembersMapper();
		int result = dao.join(dto);
		
		if(result > 0) {
			response.getWriter().print("true");
		}else {
			response.getWriter().print("false");
		}
		
		
		
		
	
	}

}
