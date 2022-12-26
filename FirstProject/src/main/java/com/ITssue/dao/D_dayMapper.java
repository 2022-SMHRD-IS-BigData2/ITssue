package com.ITssue.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.ITssue.database.SessionManger;
import com.ITssue.entity.D_day;

public class D_dayMapper {

	SqlSessionFactory sqlSessionFactory = SessionManger.getSqlSessionFactory();
	
	public D_day d_day(String id) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		
		D_day result = session.selectOne("d_day",id);
		
		session.close();
		
		return result;
		
	}
	
	public int d_dayInsert(D_day dto) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		
		int cnt = session.insert("d_day_insert",dto);
		
		session.close();
		
		return cnt;
	}
	
	public List<D_day> d_dayList(String id) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		
		List<D_day> result = session.selectList("d_dayList",id);
		
		session.close();
		
		return result;
		
	}
	
	public int d_dayDelete(int d_day_no) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		
		int cnt = session.delete("d_day_delete", d_day_no);
		
		session.close();
		
		return cnt;
	}
	
	
}
