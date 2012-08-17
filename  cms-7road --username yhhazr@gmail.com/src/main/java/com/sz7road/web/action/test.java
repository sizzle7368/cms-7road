package com.sz7road.web.action;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionSupport;
import com.sz7road.web.common.listener.SyetemConfig;
/**
 * 
 * @author hai.yuan
 *
 */
public class test extends ActionSupport {
	
	private static final long serialVersionUID = 1L;
	
	Logger logger = Logger.getLogger(test.class);
	
	public String login(){
		logger.error("error ok!");
		logger.debug("debug ok!");
		logger.info("info ok!");
		System.out.println(SyetemConfig.getProperty("test"));
		return SUCCESS;
	}
	
}
