package com.sz7road.web.dao;

import java.util.List;

import com.sz7road.web.model.pagination.PageInfo;
import com.sz7road.web.model.user.User;

public interface UserDao {

	public User getUserByName(String userName) throws Exception;
	
	public List<User> getAllUsers(PageInfo pageInfo) throws Exception;
	
	public int getAllUsersCount() throws Exception;
	
	public void insertUser(User user) throws Exception;
	
	public void deleteUser(User user) throws Exception;
	
	public User getUserById(int id) throws Exception;
}
