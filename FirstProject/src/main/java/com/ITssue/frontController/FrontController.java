package com.ITssue.frontController;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ITssue.controller.Controller;
import com.ITssue.controller.GoMainCon;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private HashMap<String, Controller> handlerMapping;
	
	public void init(ServletConfig config) throws ServletException {
		System.out.println("Servlet 생성");
		
		
		handlerMapping = new HashMap<>();
		
		// forward
		 handlerMapping.put("/goMain.do", new GoMainCon() );
		
		//========================
		// redirect
		// handlerMapping.put("/join.do", new JoinCon() );
		
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();

		String cpath = request.getContextPath();

		String mapping = uri.substring(cpath.length());
		System.out.println(mapping);
		
		String nextPage = null;

		// Controller Interface로 업캐스팅해서 모든 Con들을 담아줄 수 있게 만듦
		Controller con = null;
		
		// 요청에 맞는 POJO 꺼내기
		con =  handlerMapping.get( mapping );
		
		
		// =============================================================================
		if (con != null) {
			nextPage = con.execute(request, response);
		}

		// 3. 페이지 이동
		if (nextPage != null) {

			if (nextPage.contains("redirect:/")) {
				response.sendRedirect(nextPage.split(":/")[1]);

			} else {

				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/" + nextPage);
				rd.forward(request, response);

			}

		}
	}

}
