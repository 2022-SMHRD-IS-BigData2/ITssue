package com.ITssue.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.ITssue.database.SessionManger;
import com.ITssue.entity.Likes;

public class LikesMapper {
	
	
	SqlSessionFactory sqlSessionFactory = SessionManger.getSqlSessionFactory();
	
	public Likes likeCheck(Likes dto) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		
		Likes result = session.selectOne("likeSelect",dto);
		
		session.close();
		
		return result;
	}
	
	public int likeInsert(Likes dto) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		
		int cnt = session.insert("likeInsert",dto);
		
		session.close();
		
		return cnt;
	}
	
	public int likeDelete(Likes dto) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		
		int cnt = session.delete("likeDelete",dto);
		
		session.close();
		
		return cnt;
	}
	
	
}
