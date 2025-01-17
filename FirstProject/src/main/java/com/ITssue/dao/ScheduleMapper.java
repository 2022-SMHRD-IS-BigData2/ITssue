package com.ITssue.dao;

import java.util.List;

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
	
	public int sche_delete(int sche_no) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		
		int cnt = session.delete("SCdelete",sche_no);
		
		session.close();
		
		return cnt;
		
	}
	
	public List<Schedule> sche_List(String id) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		
		List<Schedule> result =session.selectList("scheList",id);
		
		session.close();
		
		return result;
		
	}
	
	public int sche_update(Schedule dto) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		
		int cnt = session.update("SCupdate",dto);
		
		session.close();
		
		return cnt;
		
	}
	
}
