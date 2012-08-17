package com.sz7road.web.common.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;

/**
 * 
 * @author hai.yuan
 *
 */
public class ApplicationInitListener implements ServletContextListener {

	Logger logger = Logger.getLogger(ApplicationInitListener.class);
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext content = sce.getServletContext();
		try {
			new SyetemConfig(content);
		} catch (Exception e) {
			logger.error("ApplicationInit Error:" + e.getMessage());
		}

	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
	}

}
