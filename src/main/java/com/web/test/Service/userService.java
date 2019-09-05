package com.web.test.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.test.Dao.UserDao;
import com.web.test.Vo.User;

@Service
public class userService {
	@Autowired
	UserDao ud;
	
	public int userInsert(User u){
		return ud.userInsert(u);
	}
	public User userLogin(User u){
		return ud.userLogin(u);
	}
	public User userSelect(String userId){
		return ud.userSelect(userId);
	}
	public int userUpdate(User u){
		System.out.println(u);
		System.out.println("업데이트?");
		return ud.userUpdate(u);
	}
}
