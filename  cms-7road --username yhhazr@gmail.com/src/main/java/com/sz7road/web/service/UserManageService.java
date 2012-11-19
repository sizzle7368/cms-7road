package com.sz7road.web.service;

import java.util.List;

import com.sz7road.web.model.pagination.PageInfo;
import com.sz7road.web.model.pagination.PaginationResult;
import com.sz7road.web.model.role.Role;
import com.sz7road.web.model.user.User;

public interface UserManageService {

	public PaginationResult<User> getUserList(PageInfo pageInfo) throws Exception;

	public List<Role> getRoleList() throws Exception;
	
	public void addUser(User user) throws Exception;
	
	public void deleteUser(int id) throws Exception;
	
	public User getUserById(int id) throws Exception;
}
