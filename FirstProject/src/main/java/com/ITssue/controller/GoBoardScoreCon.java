package com.ITssue.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ITssue.dao.ScoreMapper;
import com.ITssue.entity.Members;
import com.ITssue.entity.Score;

public class GoBoardScoreCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Members info = (Members)session.getAttribute("info");
		
		ScoreMapper dao = new ScoreMapper();
		List<Score> result = dao.scoreList(info.getId());
		
		if(result.size() > 0) {
			System.out.println("score 데이터 추출 완료");
			request.setAttribute("scoreList", result);
		}else {
			System.out.println("score가 없습니다");
		}
		
		
		
		
		
		
		return "myboardscore";
	}

}
