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

public class GoScheCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Members info = (Members)session.getAttribute("info");
		
		D_dayMapper dao = new D_dayMapper();
		List<D_day> list = dao.d_dayList(info.getId());
		
		
		
		
		
		
		
			
			
		
		
		return "a_2_sche";
	}

}
