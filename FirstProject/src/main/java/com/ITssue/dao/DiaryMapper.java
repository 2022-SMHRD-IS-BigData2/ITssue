package com.ITssue.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.ITssue.database.SessionManger;
import com.ITssue.entity.Board;
import com.ITssue.entity.Diary;

public class DiaryMapper {

	SqlSessionFactory sqlSessionFactory = SessionManger.getSqlSessionFactory();
	
public List<Diary> diaryList(String id) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		
		List<Diary> result = session.selectList("diaryList",id);
		
		session.close();
		
		return result;
		
	}
public Diary pickDiary(int board_no){
	SqlSession session = sqlSessionFactory.openSession(true);
	
	Diary result = session.selectOne("pickDiary",board_no);
	
	session.close();
	
	return result;
}

public int deleteDiary(int diary_no) {
    SqlSession session = sqlSessionFactory.openSession(true);
		
		int cnt = session.delete("deleteDiary",diary_no);
		
		session.close();
		
		return cnt;
	}

public int diaryWrite(Diary dto) {
	
	SqlSession session = sqlSessionFactory.openSession(true);
	
	int cnt = session.insert("diaryWrite",dto);
	
	session.close();
	
	return cnt;
	
}
}

