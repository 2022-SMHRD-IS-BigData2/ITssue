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

import com.ITssue.controller.BoardListCon;
import com.ITssue.controller.CommDeleteOkCon;
import com.ITssue.controller.CommWriteCon;
import com.ITssue.controller.Controller;
import com.ITssue.controller.D_dayDeleteCon;
import com.ITssue.controller.D_dayInsertCon;
import com.ITssue.controller.DiaryDeleteCon;
import com.ITssue.controller.DiaryInsertCon;
import com.ITssue.controller.GoBoardCon;
import com.ITssue.controller.GoBoardDiaryCon;
import com.ITssue.controller.GoBoardScoreCon;
import com.ITssue.controller.GoBoardTimeCon;
import com.ITssue.controller.GoBoardViewCon;
import com.ITssue.controller.GoCommCon;
import com.ITssue.controller.GoCommListCon;
import com.ITssue.controller.GoCommWriteCon;
import com.ITssue.controller.GoDiaryViewCon;
import com.ITssue.controller.GoDiaryWriteCon;
import com.ITssue.controller.GoJoinCon;
import com.ITssue.controller.GoLoginCon;
import com.ITssue.controller.GoMainCon;
import com.ITssue.controller.GoMembersChartCon;
import com.ITssue.controller.GoNaverCallBackCon;
import com.ITssue.controller.GoScheCon;
import com.ITssue.controller.GoUpdateCon;
import com.ITssue.controller.GoWelcomeCon;
import com.ITssue.controller.GoWriteScoreCon;
import com.ITssue.controller.JoinCon;
import com.ITssue.controller.LoginCon;
import com.ITssue.controller.LogoutCon;
import com.ITssue.controller.MemberDeleteCon;
import com.ITssue.controller.MemberUpdateCon;
import com.ITssue.controller.NaverLoginCon;
import com.ITssue.controller.ScheduleDeleteCon;
import com.ITssue.controller.ScheduleJoinCon;
import com.ITssue.controller.ScheduleUdateCon;
import com.ITssue.controller.ScoreDeleteCon;
import com.ITssue.controller.StudyTimePlusCon;
import com.ITssue.controller.ViewCommentCon;
import com.ITssue.controller.WriteCommentCon;
import com.ITssue.controller.WriteScoreCon;
import com.ITssue.controller.memoWriteCon;


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
		 handlerMapping.put("/goWelcome.do", new GoWelcomeCon() );
		 handlerMapping.put("/goCommList.do", new GoCommListCon() );
		 handlerMapping.put("/goCommWrite.do", new GoCommWriteCon() );
		 handlerMapping.put("/goBoardView.do", new GoBoardViewCon() );
		 handlerMapping.put("/navercallback.do", new GoNaverCallBackCon() );
		 handlerMapping.put("/goDiaryWrite.do", new GoDiaryWriteCon() );
		 handlerMapping.put("/goDiaryView.do", new GoDiaryViewCon() );
		 handlerMapping.put("/goBoardDiary.do", new GoBoardDiaryCon() );
		 handlerMapping.put("/goBoardTime.do", new GoBoardTimeCon() );
		 handlerMapping.put("/goBoardScore.do", new GoBoardScoreCon() );
		 handlerMapping.put("/goWriteScore.do", new GoWriteScoreCon() );
		 handlerMapping.put("/goMembersChart.do", new GoMembersChartCon() );
		 
		 
		 
		 
		
		//========================
		// redirect
		// handlerMapping.put("/join.do", new JoinCon() );
		 handlerMapping.put("/login.do", new LoginCon());
		 handlerMapping.put("/join.do", new JoinCon());
		 handlerMapping.put("/commWrite.do", new CommWriteCon());
		 handlerMapping.put("/logout.do", new LogoutCon());
		 handlerMapping.put("/memberUpdate.do", new MemberUpdateCon());
		 handlerMapping.put("/boardList.do", new BoardListCon());
		 handlerMapping.put("/studyTimePlus.do", new StudyTimePlusCon());
		 handlerMapping.put("/memoWrite.do", new memoWriteCon());
		 handlerMapping.put("/scheduleJoin.do", new ScheduleJoinCon());
		 handlerMapping.put("/scheduleDelete.do", new ScheduleDeleteCon());
		 handlerMapping.put("/scheduleupdate.do", new ScheduleUdateCon());
		 handlerMapping.put("/d_dayInsert.do", new D_dayInsertCon());
		 handlerMapping.put("/d_dayDelete.do", new D_dayDeleteCon());
		 handlerMapping.put("/memberDelete.do", new MemberDeleteCon());
		 handlerMapping.put("/commDeleteOk.do", new CommDeleteOkCon());
		 handlerMapping.put("/naverLogin.do", new NaverLoginCon());
		 handlerMapping.put("/diaryDelete.do", new DiaryDeleteCon());
		 handlerMapping.put("/diaryInsert.do", new DiaryInsertCon());
		 handlerMapping.put("/scoreDelete.do", new ScoreDeleteCon());
		 handlerMapping.put("/writeScore.do", new WriteScoreCon());
		 handlerMapping.put("/writeComment.do", new WriteCommentCon());
		 handlerMapping.put("/viewComment.do", new ViewCommentCon());
		 
		 
		
		 
		 
		
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
