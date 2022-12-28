package com.ITssue.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ITssue.dao.D_dayMapper;
import com.ITssue.entity.D_day;
import com.ITssue.entity.Members;
import com.google.gson.Gson;

public class D_dayInsertCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String content = request.getParameter("content");
		String dt = request.getParameter("dt");
		
		HttpSession session = request.getSession();
		Members info = (Members)session.getAttribute("info");
		
		
		if(content.equals("")) {
			content = "noTitle";
		}
		if(dt.equals("")) {
			LocalDate now = LocalDate.now();
			
			int nowYear = now.getYear();
			int nowMonth = now.getMonthValue();
			int nowDays = now.getDayOfMonth();
			
			dt = nowYear+"-"+nowMonth+"-"+nowDays;
			
		}
		
		
		D_day dto = new D_day();
		dto.setD_day_content(content);
		dto.setD_day_dt(dt);
		dto.setId(info.getId());
		
		D_dayMapper dao = new D_dayMapper();
		int result = dao.d_dayInsert(dto);
		
		if(result > 0) {
			//=========================================================================================
			
			List<D_day> list = dao.d_dayList(info.getId());
			D_day d_day = list.get(list.size() -1);
			
			LocalDate now = LocalDate.now();
			
			int nowYear = now.getYear();
			int nowMonth = now.getMonthValue();
			int nowDays = now.getDayOfMonth();
			
			
				
			String dates =  d_day.getD_day_dt().split(" ")[0];
				
			int year = Integer.parseInt(dates.split("-")[0]);
			int month = Integer.parseInt(dates.split("-")[1]);
			int days = Integer.parseInt(dates.split("-")[2]);
				
				
			Calendar startCalendar = new GregorianCalendar(year, month, days, 0,0,0);
			Date startDT = startCalendar.getTime();
				
			Calendar endCalendar = new GregorianCalendar(nowYear, nowMonth, nowDays, 0, 0, 0);
			Date endDT = endCalendar.getTime();
				
			long diff = startDT.getTime() - endDT.getTime();
			long diffdays = (diff / (24 * 60 * 60 * 1000L)) % 365; // 최종 차이 결과물 + 1 해줘야함
				
			
			if(diffdays > 0) {
				d_day.setD_day_dt("D-"+(diffdays));
			}else{
				d_day.setD_day_dt("D-day");
			}
			
			Gson gson = new Gson();
			String json = gson.toJson(d_day);
			
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(json);
			
			//=========================================================================================
		}else {
		}
		
		return null;
	}

}
