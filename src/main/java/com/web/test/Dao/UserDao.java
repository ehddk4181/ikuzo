package com.web.test.Dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.test.Vo.User;

@Repository
public class UserDao {
	
	@Autowired
	SqlSession s;
	
	public int userInsert(User u){
		UserMapper um = s.getMapper(UserMapper.class);
		return um.userInsert(u);
	}
	public User userLogin(User u){
		UserMapper um = s.getMapper(UserMapper.class);
		return um.userLogin(u);
		
	}
	public User userSelect(String userId){
		UserMapper um = s.getMapper(UserMapper.class);
		return um.userSelect(userId);
		
	}
	public int userUpdate(User u){
		UserMapper um = s.getMapper(UserMapper.class);
		return um.userUpdate(u);
	}
	
}
