package com.web.test.Dao;

import com.web.test.Vo.User;

public interface UserMapper {
	
	public int userInsert(User u);
	
	public User userLogin(User u);
	
	public User userSelect(String userId);
	
	public int userUpdate(User u);
}
