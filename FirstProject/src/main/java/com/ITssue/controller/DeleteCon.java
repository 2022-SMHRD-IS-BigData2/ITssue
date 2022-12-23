package com.ITssue.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ITssue.dao.MembersMapper;
import com.ITssue.entity.Members;

public class DeleteCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 인코딩
		request.setCharacterEncoding("utf-8");
		
		// 데이터 수집
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		// DTO에 데이터 담기
		Members dto = new Members();
		dto.setId(id);
		dto.setPw(pw);
		
		// delete 메서드 사용
		MembersMapper dao = new MembersMapper();
		int result = dao.delete(dto);
		return null;
	}

}
