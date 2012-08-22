package com.sz7road.web.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.struts2.json.annotations.JSON;

import com.opensymphony.xwork2.ActionSupport;
import com.sz7road.web.common.util.HibernateUtil;
import com.sz7road.web.model.role.Role;
import com.sz7road.web.model.user.User;
/**
 * 
 * @author hai.yuan
 *
 */
public class test extends ActionSupport {
	
	private static final long serialVersionUID = 1L;
	private String name;
	private String password;
	Logger logger = Logger.getLogger(test.class);
	
	public String login(){
		return SUCCESS;
	}
	public String submit() {
		
//		Role role = new Role();
//		role.setEnable(true);
//		role.setRoleDesc("管理员");
//		role.setRoleName("超级管理员");
//		HibernateUtil.add(role);
//		User user = new User();
//		user.setEmail("sdf");
//		user.setPassword("21232f297a57a5a743894a0e4a801fc3");
//		user.setUserName("admin");
//		user.setRole(role);
//		HibernateUtil.add(user);
		return SUCCESS;
	}
	
	
	public void validateSubmit() {
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
	
	
	
	
	
	
	
	
	
	
	
	
}
