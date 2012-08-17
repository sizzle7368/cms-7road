package com.sz7road.web.common.listener;

import java.io.InputStream;
import java.util.Properties;

import javax.servlet.ServletContext;

import org.apache.log4j.Logger;

/**
 * 
 * @author hai.yuan
 *
 */
public class SyetemConfig {

	private static Properties properties = new Properties();
	
	Logger logger = Logger.getLogger(SyetemConfig.class);
	
	public SyetemConfig(ServletContext context){
		try {
			InputStream fileStream = context.getResourceAsStream("WEB-INF/classes/applicationConfig.properties");
			properties.load(fileStream);
			if(fileStream != null){
				fileStream.close();
			}
		} catch (Exception e) {
			logger.error("Load ApplicationConfig Properties Error:" + e.getMessage());
		}
	}
	
	public static String getProperty(String key){
		return properties.getProperty(key);
	}
}
