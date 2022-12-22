package com.ITssue.dao;

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
	
	
}
