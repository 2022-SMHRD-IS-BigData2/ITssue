package com.ITssue.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.ITssue.database.SessionManger;
import com.ITssue.entity.Study_time;

public class Study_timeMapper {

	SqlSessionFactory sqlSessionFactory = SessionManger.getSqlSessionFactory();
	
	public int timePlus(Study_time dto) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		
		int cnt = session.insert("plus",dto);
		
		session.close();
		
		return cnt;
		
	}
	
	public List<Study_time> timeGet(String id) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		
		List<Study_time> result = session.selectList("get", id);
		
		session.close();
		
		return result;
	}
	
	
}
