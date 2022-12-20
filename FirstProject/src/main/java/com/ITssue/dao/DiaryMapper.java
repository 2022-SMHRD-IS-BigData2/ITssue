package com.ITssue.dao;

import org.apache.ibatis.session.SqlSessionFactory;

import com.ITssue.database.SessionManger;

public class DiaryMapper {

	SqlSessionFactory sqlSessionFactory = SessionManger.getSqlSessionFactory();
}
