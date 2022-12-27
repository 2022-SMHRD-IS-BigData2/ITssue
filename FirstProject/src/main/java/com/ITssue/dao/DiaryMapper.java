package com.ITssue.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.ITssue.database.SessionManger;
import com.ITssue.entity.Diary;

public class DiaryMapper {

	SqlSessionFactory sqlSessionFactory = SessionManger.getSqlSessionFactory();
	
public List<Diary> diaryList() {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		
		List<Diary> result = session.selectList("diaryList");
		
		session.close();
		
		return result;
		
	}
}
