package com.sz7road.web.dao;

import com.sz7road.web.model.user.User;

public interface UserDao {

	public User getUserByName(String userName) throws Exception;
	
}
