package com.ITssue.dao;

import org.apache.ibatis.session.SqlSessionFactory;

import com.ITssue.database.SessionManger;

public class D_dayMapper {

	SqlSessionFactory sqlSessionFactory = SessionManger.getSqlSessionFactory();
}
