package com.ITssue.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ITssue.dao.DiaryMapper;
import com.ITssue.entity.Diary;

public class GoBoardCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		DiaryMapper dao = new DiaryMapper();
		List<Diary> diary = dao.diaryList();
		
		
		
		HttpSession session = request.getSession();
		session.setAttribute("diaryList", diary);
		
		
		
		return "a_3_board";
	}

}
