package com.ITssue.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
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

public class GoScheCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Members info = (Members)session.getAttribute("info");
		
		D_dayMapper dao = new D_dayMapper();
		List<D_day> list = dao.d_dayList(info.getId());
		
		LocalDate now = LocalDate.now();
		LocalTime nowT = LocalTime.now();
		
		int nowYear = now.getYear();
		int nowMonth = now.getMonthValue();
		int nowDays = now.getDayOfMonth();
		int nowHour = nowT.getHour();
		int nowMin = nowT.getMinute();
		int nowSec = nowT.getSecond();
		
		for(D_day d_day : list) {
			
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
			
			System.out.println(d_day.getD_day_dt());
			
			
			
		}
		
		
		
		
		
		request.setAttribute("D_dayList", list);
		
		
		
		
		
		
		
			
			
		
		
		return "a_2_sche";
	}

}
