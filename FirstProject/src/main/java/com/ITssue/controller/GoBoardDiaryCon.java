package com.ITssue.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ITssue.dao.DiaryMapper;
import com.ITssue.entity.Diary;
import com.ITssue.entity.Members;

public class GoBoardDiaryCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Members info = (Members) session.getAttribute("info");

		DiaryMapper dao = new DiaryMapper();
		List<Diary> diary = dao.diaryList(info.getId());

		if (diary.size() > 0) {
			request.setAttribute("diaryList", diary);
		}
		
		return "myboarddiary";
	}

}
