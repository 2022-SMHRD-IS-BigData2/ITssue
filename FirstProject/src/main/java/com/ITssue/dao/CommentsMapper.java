package com.ITssue.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.ITssue.database.SessionManger;
import com.ITssue.entity.Comments;
import com.ITssue.entity.D_day;

public class CommentsMapper {

	SqlSessionFactory sqlSessionFactory = SessionManger.getSqlSessionFactory();
	
	
public List<Comments> viewComment(int board_no) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		
		List<Comments> result = session.selectList("viewComment",board_no);
		
		session.close();
		
		return result;
		
	}

public int commentWrite(Comments dto) {
	
	SqlSession session = sqlSessionFactory.openSession(true);
	
	int cnt = session.insert("commentWrite",dto);
	
	session.close();
	
	return cnt;
}

public int deleteComment(Comments dto) {
    SqlSession session = sqlSessionFactory.openSession(true);
		
		int cnt = session.delete("deleteComment",dto);
		
		session.close();
		
		return cnt;
	}


	
}
