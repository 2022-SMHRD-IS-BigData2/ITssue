package com.ITssue.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ITssue.dao.MembersMapper;
import com.ITssue.entity.Members;

public class MemberDeleteCon implements Controller {

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
		int cnt = dao.delete(dto);
		
		// 성공 실패 구분
		String nextPage = "";
		if(cnt > 0) {
			System.out.println("회원 삭제 성공!");
			nextPage = "redirect:/goWelcome.do";
		} else {
			System.out.println("회원 삭제 실패");
			nextPage = "redirect:/goUpdate.do";
		}
		
		return nextPage;


	}

}
