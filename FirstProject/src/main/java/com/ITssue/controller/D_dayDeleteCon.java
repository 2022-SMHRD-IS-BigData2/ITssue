package com.ITssue.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ITssue.dao.D_dayMapper;
import com.ITssue.entity.D_day;
import com.ITssue.entity.Members;

public class D_dayDeleteCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Members info = (Members)session.getAttribute("info");
		
		
		D_dayMapper dao = new D_dayMapper();
		List<D_day> d_day_list = dao.d_dayList(info.getId());
		
		D_day d_day = d_day_list.get(d_day_list.size()-1);
		
		int result = dao.d_dayDelete(d_day.getD_day_no());
		
		if(result > 0) {
			response.getWriter().print(true);
		}else {
		}
		
		
		return null;
	}

}
