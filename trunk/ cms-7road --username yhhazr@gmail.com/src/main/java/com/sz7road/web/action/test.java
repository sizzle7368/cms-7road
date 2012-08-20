package com.sz7road.web.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.struts2.json.annotations.JSON;

import com.opensymphony.xwork2.ActionSupport;
import com.sz7road.web.common.listener.SyetemConfig;
/**
 * 
 * @author hai.yuan
 *
 */
public class test extends ActionSupport {
	
	private static final long serialVersionUID = 1L;
	private String name;
	private String password;
	private List<String> error = new ArrayList<String>();
	Logger logger = Logger.getLogger(test.class);
	
	public String login(){
		logger.error("error ok!");
		logger.debug("debug ok!");
		logger.info("info ok!");
		System.out.println(SyetemConfig.getProperty("test"));
		return SUCCESS;
	}
	public String submit() {
		System.out.println(name);
		return SUCCESS;
	}
	
	
	public void validateSubmit() {
		if(name.length() == 0 || "".equals(name)){
			this.addFieldError("name", "请输入用户名");
		}
		if(password.length() == 0 || "".equals(password)){
			this.addFieldError("password", "请输入密码");
		}
		if(true){
			
			
			this.addFieldError("error", "用户名或密码错误！");
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
	@JSON(name="errors")
	public List<String> getError() {
		return error;
	}
	public void setError(List<String> error) {
		this.error = error;
	}
	@Override
	@JSON(serialize=false)
	public Map<String, List<String>> getErrors() {
		// TODO Auto-generated method stub
		return super.getErrors();
	}
	
	
	
	
	
	
	
	
	
	
}
