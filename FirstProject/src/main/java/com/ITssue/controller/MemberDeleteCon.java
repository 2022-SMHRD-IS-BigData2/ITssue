package com.ITssue.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ITssue.dao.MembersMapper;
import com.ITssue.entity.Members;

public class MemberDeleteCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		Members info = (Members)session.getAttribute("info");
		
		
		
		// delete 메서드 사용
		MembersMapper dao = new MembersMapper();
		int cnt = dao.delete(info);
		
		// 성공 실패 구분
		String nextPage = "";
		if(cnt > 0) {
			nextPage = "redirect:/goWelcome.do";
		} else {
			nextPage = "redirect:/goUpdate.do";
		}
		
		return nextPage;


	}

}
