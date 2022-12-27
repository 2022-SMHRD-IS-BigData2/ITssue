package com.ITssue.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ITssue.dao.BoardMapper;
import com.ITssue.dao.DiaryMapper;

public class DiaryDeleteCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
       int diary_no = Integer.parseInt(request.getParameter("diary_no"));

		DiaryMapper dao = new DiaryMapper();
		
		int cnt = dao.deleteDiary(diary_no);
		
		String nextPage="";
		if(cnt > 0) {
			nextPage="redirect:/goBoardDiary.do";
		}else {
			nextPage="redirect:/goBoardDiary.do";
			
		}
		
		return nextPage;
	}
	}


