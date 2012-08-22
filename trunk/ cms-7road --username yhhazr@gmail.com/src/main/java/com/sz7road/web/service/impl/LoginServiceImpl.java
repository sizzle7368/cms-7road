package com.sz7road.web.service.impl;

import java.awt.SystemColor;

import com.sz7road.web.common.listener.SystemConfig;
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
		boolean result = false;
		String ipStr = SystemConfig.getProperty("admin.allowedIps");
		String[] ips = ipStr.split("|");
		for (int i = 0; i < ips.length; i++) {
			if(ips[i].equals(ip) || "*".equals(ips[i])){
				result = true;
			}
		}
		return result;
	}

}
