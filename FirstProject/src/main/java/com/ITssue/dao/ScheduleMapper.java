package com.ITssue.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.ITssue.database.SessionManger;
import com.ITssue.entity.Schedule;

public class ScheduleMapper {

	SqlSessionFactory sqlSessionFactory = SessionManger.getSqlSessionFactory();
	
	public int sche_in(Schedule dto) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		
		int cnt = session.insert("SCinsert",dto);
		
		session.close();
		
		return cnt;
		
	}
	
	public int sche_delete(Schedule dto) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		
		int cnt = session.delete("SCdelete",dto);
		
		session.close();
		
		return cnt;
		
	}
	
}
