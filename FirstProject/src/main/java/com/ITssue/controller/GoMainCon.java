package com.ITssue.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ITssue.dao.D_dayMapper;
import com.ITssue.entity.D_day;
import com.ITssue.entity.Members;

public class GoMainCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Members info = (Members)session.getAttribute("info");
		
		D_dayMapper dao = new D_dayMapper();
		D_day result = dao.d_day(info.getId());
		
		
		
		if(result != null) {
			request.setAttribute("d_day", result);
			
			String date = result.getD_day_dt().split(" ")[0];
			String time = result.getD_day_dt().split(" ")[1];
			
			String[] days = date.split("-");
			String[] times = time.split("\\.")[0].split(":");
			
			int[] daily = new int [days.length];
			int[] tTime = new int [times.length];
			
			for(int i = 0; i < days.length; i++) {
				daily[i] = Integer.parseInt(days[i]);
				tTime[i] = Integer.parseInt(times[i]);
				
			}
			
			int year = daily[0];
			int month = daily[1];
			int day = daily[2];
			int hour = tTime[0];
			int min = tTime[1];
			int sec = tTime[2];
			
			Calendar startCalendar = new GregorianCalendar(year, month, day, hour, min, sec);
			Date startDT = startCalendar.getTime();
			
			
			LocalDate now = LocalDate.now();
			LocalTime nowT = LocalTime.now();
			
			year = now.getYear();
			month = now.getMonthValue();
			day = now.getDayOfMonth();
			hour = nowT.getHour();
			min = nowT.getMinute();
			sec = nowT.getSecond();
			
			Calendar endCalendar = new GregorianCalendar(year, month, day, hour, min, sec);
			Date endDT = endCalendar.getTime();
			
			long diff = startDT.getTime() - endDT.getTime();
			long diffdays = (diff / (24 * 60 * 60 * 1000L)) % 365; // 최종 차이 결과물 + 1 해줘야함
			
			String d_day = "";
			
			if(diffdays > 0) {
				d_day = "D-"+(diffdays+1);
			}else{
				d_day = "D-day";
			}
			
			request.setAttribute("time", d_day);
			
		}else {
			System.out.println("실패했다와");
		}
		
		
		
		
		
		
		
		return "a_1_main";
	}

}
