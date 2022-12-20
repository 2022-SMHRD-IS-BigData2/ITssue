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
import com.ITssue.controller.GoBoardCon;
import com.ITssue.controller.GoCommCon;
import com.ITssue.controller.GoJoinCon;
import com.ITssue.controller.GoLoginCon;
import com.ITssue.controller.GoMainCon;
import com.ITssue.controller.GoScheCon;
import com.ITssue.controller.GoUpdateCon;
import com.ITssue.controller.GoWelcomeCon;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private HashMap<String, Controller> handlerMapping;
	
	public void init(ServletConfig config) throws ServletException {
		System.out.println("Servlet 생성");
		
		
		handlerMapping = new HashMap<>();
		
		// forward
		handlerMapping.put("/goBoard.do", new GoBoardCon() );
		handlerMapping.put("/goComm.do", new GoCommCon() );
		 handlerMapping.put("/goJoin.do", new GoJoinCon() );
		 handlerMapping.put("/goLogin.do", new GoLoginCon() );
		 handlerMapping.put("/goMain.do", new GoMainCon() );
		 handlerMapping.put("/goSche.do", new GoScheCon() );
		 handlerMapping.put("/goUpdate.do", new GoUpdateCon() );
		 handlerMapping.put("/goWelcom.do", new GoWelcomeCon() );
		
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

				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/" + nextPage + ".jsp");
				rd.forward(request, response);

			}

		}
	}

}