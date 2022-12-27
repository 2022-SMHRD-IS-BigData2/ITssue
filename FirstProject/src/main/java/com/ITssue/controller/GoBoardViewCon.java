package com.ITssue.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ITssue.dao.BoardMapper;
import com.ITssue.dao.CommentsMapper;
import com.ITssue.entity.Board;
import com.ITssue.entity.Comments;
import com.ITssue.entity.Members;

public class GoBoardViewCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		List<Board> boa =  (List<Board>)session.getAttribute("boardList");
        int num = Integer.parseInt(request.getParameter("num"));
		
		// DAO의 boardView 사용
		BoardMapper dao = new BoardMapper();
		
		Board board =  dao.boardView( num );
		
		CommentsMapper dao2 = new CommentsMapper();
		
		List<Comments> comm = dao2.viewComment(board.getBoard_no());
		
		session.setAttribute("boardinfo", board);
		session.setAttribute("comminfo", comm);
		
		return "viewCommBoard";
	}

}
