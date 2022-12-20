package com.ITssue.dao;

import org.apache.ibatis.session.SqlSessionFactory;

import com.ITssue.database.SessionManger;

public class MembersMapper {

	SqlSessionFactory sqlSessionFactory = SessionManger.getSqlSessionFactory();
}
