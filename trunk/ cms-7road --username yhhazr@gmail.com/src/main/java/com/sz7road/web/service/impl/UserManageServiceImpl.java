package com.sz7road.web.service.impl;

import java.util.List;

import com.sz7road.web.dao.UserDao;
import com.sz7road.web.dao.HibernateImpl.UserDaoHibernateImpl;
import com.sz7road.web.model.pagination.PageInfo;
import com.sz7road.web.model.pagination.PaginationResult;
import com.sz7road.web.model.user.User;
import com.sz7road.web.service.UserManageService;

public class UserManageServiceImpl implements UserManageService {

	private static UserManageServiceImpl _this;
	
	private static UserDao userDao;
	 
	public UserManageServiceImpl(){
		userDao = UserDaoHibernateImpl.getInstance();
	}
	
	public synchronized static UserManageServiceImpl getInstance() {
		if (_this == null)
			_this = new UserManageServiceImpl();
		return _this;
	}
	@Override
	public PaginationResult<User> getUserList(PageInfo pageInfo)
			throws Exception {
		List<User> userList = userDao.getAllUsers(pageInfo);
		int count = userDao.getAllUsersCount();
		PaginationResult<User> pageResult = new PaginationResult<User>(count, userList);
		return pageResult;
	}

}
