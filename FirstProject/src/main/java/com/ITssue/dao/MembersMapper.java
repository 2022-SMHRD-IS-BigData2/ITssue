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
	
	public int update(Members dto) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		
		int cnt = session.update("update",dto);
		
		session.close();
		
		return cnt;
		
	}
	
	public int memoWrite(Members dto) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		
		int cnt = session.update("memoWrite",dto);
		
		session.close();
		
		return cnt;
	}

	public int delete(Members dto) {

		SqlSession session = sqlSessionFactory.openSession(true);
		
		int cnt = session.delete("delete",dto);
		
		session.close();
		
		return cnt;
	}
	
	public Members idSearch(String id) {
		
SqlSession session = sqlSessionFactory.openSession(true);
		
		Members nick = session.selectOne("idSearch",id);
		
		session.close();
		
		return nick;
		
		
	}


}
