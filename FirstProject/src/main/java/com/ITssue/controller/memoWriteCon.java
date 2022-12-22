package com.ITssue.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ITssue.dao.MembersMapper;
import com.ITssue.entity.Members;

public class memoWriteCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String content = request.getParameter("content");
		
		HttpSession session = request.getSession();
		Members dto = (Members)session.getAttribute("info");
		
		dto.setContent(content);
		
		MembersMapper dao = new MembersMapper();
		int result = dao.memoWrite(dto);
		
		
		
		if(result > 0) {
			session.setAttribute("info", dto);
			response.getWriter().print("true");
		}else {
			response.getWriter().print("false");
		}
		
		
		
		return null;
	}

}
