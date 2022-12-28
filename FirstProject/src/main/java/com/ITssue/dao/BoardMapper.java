package com.ITssue.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.ITssue.database.SessionManger;
import com.ITssue.entity.Board;

public class BoardMapper {

	SqlSessionFactory sqlSessionFactory = SessionManger.getSqlSessionFactory();
	
	public int boardWrite(Board dto) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		
		int cnt = session.insert("newWrite",dto);
		
		session.close();
		
		return cnt;
		
	}
	
	public List<Board> boardList() {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		
		List<Board> result = session.selectList("listView");
		
		session.close();
		
		return result;
		
	}
	
	public List<Board> boardRank(){
		
		SqlSession session = sqlSessionFactory.openSession(true);
		
		List<Board> result = session.selectList("boardRank");
		
		session.close();
		
		return result;
	}
	
	public Board boardView(int num) {
		 SqlSession session = sqlSessionFactory.openSession(true);
		 Board board = session.selectOne("boardView", num);
		 session.close();
		 return board;
	 }
	
	public int deleteBoard(int board_no) {
       SqlSession session = sqlSessionFactory.openSession(true);
		
		int cnt = session.delete("deleteBoard",board_no);
		
		session.close();
		
		return cnt;
	}
	
	public int likePlus(int board_no) {
       SqlSession session = sqlSessionFactory.openSession(true);
		
		int cnt = session.delete("likePlusUpdate",board_no);
		
		session.close();
		
		return cnt;
		
	}
	public int likeMinus(int board_no) {
		
	       SqlSession session = sqlSessionFactory.openSession(true);
			
			int cnt = session.delete("likeMinusUpdate",board_no);
			
			session.close();
			
			return cnt;
			
	}
	public Board boardInfo(int board_no) {
		
		 SqlSession session = sqlSessionFactory.openSession(true);
		 
		 Board result = session.selectOne("boardInfo",board_no);
		 
		 session.close();
		 
		 return result;
	}
	
}
