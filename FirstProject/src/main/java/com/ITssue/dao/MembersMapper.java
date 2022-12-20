package com.ITssue.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.ITssue.database.SessionManger;
import com.ITssue.entity.Members;

public class MembersMapper {

	SqlSessionFactory sqlSessionFactory = SessionManger.getSqlSessionFactory();

	public int join(Members dto) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		
		int cnt = session.insert("join",dto);
		
		session.close();
		
		return cnt;
	}
	
	public Members login(Members dto) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		
		Members result = session.selectOne("login",dto);
		
		session.close();
		
		return result;
	}


}
