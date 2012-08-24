package com.sz7road.web.action.admin.login;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.sz7road.web.service.LoginService;
import com.sz7road.web.service.impl.LoginServiceImpl;
/**
 * 
 * @author hai.yuan
 *
 */
public class AdminLoginAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(AdminLoginAction.class);
	private String userName;
	private String password;
	private LoginService loginService = LoginServiceImpl.getInstance();
	
	public String login(){
		return SUCCESS;
	}
	
	public String loginSubmit(){
		String result = INPUT;
		HttpServletRequest request = ServletActionContext.getRequest();
		String ip = getIpAddr(request);
		try {
			if(!loginService.checkIp(ip)){
				this.addActionError("您所在的IP不允许访问本系统！");
				result = INPUT;
			}else{
				if(loginService.checkLogin(userName, password)){
					ServletActionContext.getRequest().getSession().setAttribute("userName", userName);
					result = SUCCESS;
				}else{
					this.addActionError("用户名或密码错误！");
					result = INPUT;
				}
			}

			
		} catch (Exception e) {
			logger.error("Login Submit Error :" + e.getMessage());
		}
			
		return result;
	}
	
	public void validateLoginSubmit(){
		
		if(userName.length() == 0 || "".equals(userName)){
			this.addFieldError("userName", "请输入用户名");
		}
		if(password.length() == 0 || "".equals(password)){
			this.addFieldError("password", "请输入密码");
		}
		
		
	}
	
	
	
	

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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
