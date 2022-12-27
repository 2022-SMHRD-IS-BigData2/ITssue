package com.ITssue.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.ITssue.database.SessionManger;
import com.ITssue.entity.Score;

public class ScoreMapper {

	SqlSessionFactory sqlSessionFactory = SessionManger.getSqlSessionFactory();

	public List<Score> scoreList(String id) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		
		List<Score> result = session.selectList("scoreList",id);
		
		session.close();
		
		return result;
		
	}

	public int scoreDelte(int score_no) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		
		int cnt = session.delete("scoreDelete",score_no);
		
		session.close();
		
		return cnt;
	}
	
	public int scoreInsert(Score dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		
		int cnt = session.insert("scoreInsert",dto);
		
		session.close();
		
		return cnt;
	}

}
