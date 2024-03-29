package com.sz7road.web.service.impl;

import java.util.List;

import com.sz7road.web.common.util.MD5Util;
import com.sz7road.web.dao.RoleDao;
import com.sz7road.web.dao.UserDao;
import com.sz7road.web.dao.HibernateImpl.RoleDaoHibernateImpl;
import com.sz7road.web.dao.HibernateImpl.UserDaoHibernateImpl;
import com.sz7road.web.model.pagination.PageInfo;
import com.sz7road.web.model.pagination.PaginationResult;
import com.sz7road.web.model.role.Role;
import com.sz7road.web.model.user.User;
import com.sz7road.web.service.UserManageService;

public class UserManageServiceImpl implements UserManageService {

	private static UserManageServiceImpl _this;
	
	private static UserDao userDao;

	private static RoleDao roleDao;
	
	public UserManageServiceImpl(){
		userDao = UserDaoHibernateImpl.getInstance();
		roleDao = RoleDaoHibernateImpl.getInstance();
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

	@Override
	public List<Role> getRoleList() throws Exception {
		return roleDao.getAllRoles();
	}

	@Override
	public void addUser(User user) throws Exception {
		Role role = roleDao.getRoleById(user.getRole().getId());
		user.setPassword(MD5Util.getMD5String(user.getPassword()));
		user.setRole(role);
		userDao.insertUser(user);
	}

	@Override
	public void deleteUser(int id) throws Exception {
		User user = userDao.getUserById(id);
		userDao.deleteUser(user);
	}

	@Override
	public User getUserById(int id) throws Exception {
		return userDao.getUserById(id);
	}

}
