package com.sz7road.web.service.impl;


import com.sz7road.web.common.listener.SystemConfig;
import com.sz7road.web.common.util.MD5Util;
import com.sz7road.web.common.util.Wildcard;
import com.sz7road.web.dao.UserDao;
import com.sz7road.web.dao.HibernateImpl.UserDaoHibernateImpl;
import com.sz7road.web.model.user.User;
import com.sz7road.web.service.LoginService;

public class LoginServiceImpl implements LoginService {

	private static LoginServiceImpl _this;
	
	private static UserDao userDao;
	 
	public LoginServiceImpl(){
		userDao = UserDaoHibernateImpl.getInstance();
	}
	
	public synchronized static LoginServiceImpl getInstance() {
		if (_this == null)
			_this = new LoginServiceImpl();
		return _this;
	}
	
	@Override
	public boolean checkIp(String ip) throws Exception {
		String ipStr = SystemConfig.getProperty("admin.allowedIps");
		return Wildcard.matches(ipStr, ip, "\\|");
	}

	@Override
	public boolean checkLogin(String userName, String password)
			throws Exception {
		boolean result = false;
		User user = userDao.getUserByName(userName);
		if(user != null){
			if(MD5Util.checkPassword(password, user.getPassword())){
				result = true;
			}
		}
		return result;
	}

}
