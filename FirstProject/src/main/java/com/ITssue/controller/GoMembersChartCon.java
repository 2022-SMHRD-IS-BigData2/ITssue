package com.ITssue.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ITssue.dao.MembersMapper;
import com.ITssue.dao.Study_timeMapper;
import com.ITssue.entity.Members;
import com.ITssue.entity.Study_time;

public class GoMembersChartCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Members info = (Members) session.getAttribute("info");

		Study_timeMapper dao = new Study_timeMapper();
		// ==========================================================================
		List<Study_time> result = dao.timeGet(info.getId());

		if (result != null) {
			for (Study_time study_time : result) {
				String startDate = study_time.getStudy_s_time().split(" ")[0];
				String startTime = study_time.getStudy_s_time().split("\\.")[0].split(" ")[1];
				String endDate = study_time.getStudy_e_time().split(" ")[0];
				String endTime = study_time.getStudy_e_time().split("\\.")[0].split(" ")[1];

				int startYear = Integer.parseInt(startDate.split("-")[0]);
				int startMonth = Integer.parseInt(startDate.split("-")[1]);
				int startDay = Integer.parseInt(startDate.split("-")[2]);

				int startHour = Integer.parseInt(startTime.split(":")[0]);
				int startMin = Integer.parseInt(startTime.split(":")[1]);
				int startSecond = Integer.parseInt(startTime.split(":")[2]);

				int endYear = Integer.parseInt(endDate.split("-")[0]);
				int endMonth = Integer.parseInt(endDate.split("-")[1]);
				int endDay = Integer.parseInt(endDate.split("-")[2]);

				int endHour = Integer.parseInt(endTime.split(":")[0]);
				int endMin = Integer.parseInt(endTime.split(":")[1]);
				int endSecond = Integer.parseInt(endTime.split(":")[2]);

				Calendar startCalendar = new GregorianCalendar(startYear, startMonth, startDay, startHour, startMin,
						startSecond);
				Date startDT = startCalendar.getTime();
				Calendar endCalendar = new GregorianCalendar(endYear, endMonth, endDay, endHour, endMin, endSecond);
				Date endDT = endCalendar.getTime();

				long diff = endDT.getTime() - startDT.getTime();
				long diffdays = (diff / (1000L));

				String amounts = "" + diffdays;
				study_time.setAmounts(amounts);
				study_time.setStudy_s_time(startDate);
				study_time.setStudy_e_time(endDate);
			}
		}
		request.setAttribute("myStudy", result);
		// ==============================================================================

		String otherId = request.getParameter("other");
		
		if(otherId != null) {
			List<Study_time> outherResult = dao.timeGet(otherId);
			for (Study_time study_time : outherResult) {
				String startDate = study_time.getStudy_s_time().split(" ")[0];
				String startTime = study_time.getStudy_s_time().split("\\.")[0].split(" ")[1];
				String endDate = study_time.getStudy_e_time().split(" ")[0];
				String endTime = study_time.getStudy_e_time().split("\\.")[0].split(" ")[1];

				int startYear = Integer.parseInt(startDate.split("-")[0]);
				int startMonth = Integer.parseInt(startDate.split("-")[1]);
				int startDay = Integer.parseInt(startDate.split("-")[2]);

				int startHour = Integer.parseInt(startTime.split(":")[0]);
				int startMin = Integer.parseInt(startTime.split(":")[1]);
				int startSecond = Integer.parseInt(startTime.split(":")[2]);

				int endYear = Integer.parseInt(endDate.split("-")[0]);
				int endMonth = Integer.parseInt(endDate.split("-")[1]);
				int endDay = Integer.parseInt(endDate.split("-")[2]);

				int endHour = Integer.parseInt(endTime.split(":")[0]);
				int endMin = Integer.parseInt(endTime.split(":")[1]);
				int endSecond = Integer.parseInt(endTime.split(":")[2]);

				Calendar startCalendar = new GregorianCalendar(startYear, startMonth, startDay, startHour, startMin,
						startSecond);
				Date startDT = startCalendar.getTime();
				Calendar endCalendar = new GregorianCalendar(endYear, endMonth, endDay, endHour, endMin, endSecond);
				Date endDT = endCalendar.getTime();

				long diff = endDT.getTime() - startDT.getTime();
				long diffdays = (diff / (1000L));

				String amounts = "" + diffdays;
				study_time.setAmounts(amounts);
				study_time.setStudy_s_time(startDate);
				study_time.setStudy_e_time(endDate);
			}
			
			request.setAttribute("outherStudy", outherResult);
			
		}
		
		MembersMapper memberdao = new MembersMapper();
		Members outherInfo= memberdao.idSearch(otherId);
		request.setAttribute("outher", outherInfo);
		
		
		
		
		
		
		
		
		

		return "membersChart";
	}

}
