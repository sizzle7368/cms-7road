package com.sz7road.web.action.admin.usermanage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.sz7road.web.model.pagination.PageInfo;
import com.sz7road.web.model.pagination.PaginationResult;
import com.sz7road.web.model.user.User;
import com.sz7road.web.service.UserManageService;
import com.sz7road.web.service.impl.UserManageServiceImpl;

public class UserManageAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(UserManageAction.class);
	private UserManageService userService = UserManageServiceImpl.getInstance();
	
	public String userManage(){
		String result = INPUT;
		HttpServletRequest request = ServletActionContext.getRequest();
		PageInfo pageInfo = new PageInfo();
		int startRow = 0;
		String pagerOffset = request.getParameter("pager.offset");
		int pageSize = 10;
		if (!StringUtils.isBlank(pagerOffset) && StringUtils.isNumeric(pagerOffset)) {
			startRow = Integer.parseInt(pagerOffset);
		}
	
		pageInfo.setStartRow(startRow);
		pageInfo.setPageSize(pageSize);
		try {
			PaginationResult<User> pageationResult = userService.getUserList(pageInfo);
			request.setAttribute("pageationResult", pageationResult);
		
			result = SUCCESS;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
	
	
}
