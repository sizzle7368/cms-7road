package com.sz7road.web.action.login;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 
 * @author hai.yuan
 *
 */
public class AdminLoginAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	Logger logger = Logger.getLogger(AdminLoginAction.class);
	private String name;
	private String password;
	
	public String login(){
		return SUCCESS;
	}
	
	public String loginSubmit(){
		return SUCCESS;
	}
	
	public void validateLoginSubmit(){
		if(name.length() == 0 || "".equals(name)){
			this.addFieldError("name", "请输入用户名");
		}
		if(password.length() == 0 || "".equals(password)){
			this.addFieldError("password", "请输入密码");
		}
	}
	
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
}
