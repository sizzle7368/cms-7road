package com.sz7road.web.service.impl;


import com.sz7road.web.common.listener.SystemConfig;
import com.sz7road.web.common.util.Wildcard;
import com.sz7road.web.service.LoginService;

public class LoginServiceImpl implements LoginService {

	private static LoginServiceImpl _this;
	
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

}
