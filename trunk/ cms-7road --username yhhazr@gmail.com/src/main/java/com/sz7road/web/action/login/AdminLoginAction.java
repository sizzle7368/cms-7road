package com.sz7road.web.action.login;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.sz7road.web.common.util.HibernateUtil;
import com.sz7road.web.model.role.Role;
import com.sz7road.web.model.user.User;
import com.sz7road.web.service.LoginService;
import com.sz7road.web.service.impl.LoginServiceImpl;
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
				this.addActionError("您的IP不允许访问本系统！");
				result = INPUT;
			}else{
				result = SUCCESS;
			}
//			Role role = new Role();
//			role.setEnable(true);
//			role.setRoleDesc("管理员");
//			role.setRoleName("超级管理员");
//			HibernateUtil.add(role);
//			User user = new User();
//			user.setEmail("sdf");
//			user.setPassword("21232f297a57a5a743894a0e4a801fc3");
//			user.setUserName("admin");
//			user.setRole(role);
//			HibernateUtil.add(user);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
			
		return result;
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
