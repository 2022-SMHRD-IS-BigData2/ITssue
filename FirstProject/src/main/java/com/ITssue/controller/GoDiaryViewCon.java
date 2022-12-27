package com.ITssue.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ITssue.dao.DiaryMapper;
import com.ITssue.entity.Diary;


public class GoDiaryViewCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
        int num = Integer.parseInt(request.getParameter("num"));
		
		// DAO의 boardView 사용
		DiaryMapper dao = new DiaryMapper();
		
		Diary diary = dao.pickDiary( num );
		
		HttpSession session = request.getSession();
		session.setAttribute("diary", diary);
		
		
		
		return "clickDiary";
	}

}
