package com.ITssue.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ITssue.dao.MembersMapper;
import com.ITssue.entity.Members;
import com.google.gson.Gson;

public class NaverLoginCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String birthday = request.getParameter("birthday");
		String birthyear = request.getParameter("birthyear");
		String nick = request.getParameter("nick");
		
		
		System.out.println(id);
		System.out.println(pw);
		System.out.println(birthday);
		System.out.println(birthyear);
		System.out.println(nick);
		
		if(birthyear == null) {
			LocalDate now = LocalDate.now();
			
			int nowYear = now.getYear();
			birthyear = nowYear+"-";
		}
		if(birthday == null) {
			LocalDate now = LocalDate.now();
			
			int nowMonth = now.getMonthValue();
			int nowDay = now.getDayOfMonth();
			
			birthyear = nowMonth+"-"+nowDay;
		}
		
		
		Members dto = new Members();
		dto.setId(id);
		dto.setPw(pw);
		dto.setBirth(birthyear+birthday);
		dto.setNick(nick);
		
		MembersMapper dao = new MembersMapper();
		Members result = dao.login(dto);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String nextPage= "goWelcome.do";
		
		if(result != null) {
			// 회원가입이 이미 되어있음
			// 또는 로그인 성공
			HttpSession session = request.getSession();
			session.setAttribute("info", result);
			nextPage="goMain.do";
			
		}else {
			// 회원가입이 되어있지 않음
			int cnt = dao.join(dto);
			
			if(cnt > 0) {
				System.out.println("회원가입 성공");
				result = dao.login(dto);
				
				if(result != null) {
					HttpSession session = request.getSession();
					session.setAttribute("info", result);
					nextPage="goMain.do";
				}
				
			}else {
				System.out.println("회원가입 실패");
			}
			
		}
		
		out.print(nextPage);
		
		return null;
	}

}
