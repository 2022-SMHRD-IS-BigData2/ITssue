package com.ITssue.controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ITssue.dao.ScoreMapper;
import com.ITssue.entity.Members;
import com.ITssue.entity.Score;

public class WriteScoreCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String subname = request.getParameter("subject");
		int grade = Integer.parseInt(request.getParameter("grade"));
		String title = request.getParameter("title");
		String date = request.getParameter("date");

		HttpSession session = request.getSession();
		Members info = (Members) session.getAttribute("info");

		if (date.equals("")) {
			LocalDate now = LocalDate.now();

			int nowYear = now.getYear();
			int nowMonth = now.getMonthValue();
			int nowDays = now.getDayOfMonth();

			date = nowYear + "-" + nowMonth + "-" + nowDays;

		}
		subname = subname.replace(" ", ",");

		Score dto = new Score();
		dto.setScore_title(title);
		dto.setScore_date(date);
		dto.setGrade(grade);
		dto.setSubname(subname);
		dto.setId(info.getId());

		System.out.println("정상진행됨");

		ScoreMapper dao = new ScoreMapper();
		int result = dao.scoreInsert(dto);
		
		if(result > 0) {
			response.getWriter().print(true);
		}else {
			response.getWriter().print(false);
		}


		return null;
	}

}
