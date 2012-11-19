package com.sz7road.web.action.admin.usermanage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.sz7road.web.model.pagination.PageInfo;
import com.sz7road.web.model.pagination.Pager;
import com.sz7road.web.model.pagination.PaginationResult;
import com.sz7road.web.model.role.Role;
import com.sz7road.web.model.user.User;
import com.sz7road.web.service.UserManageService;
import com.sz7road.web.service.impl.UserManageServiceImpl;

public class UserManageAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(UserManageAction.class);
	private UserManageService userService = UserManageServiceImpl.getInstance();
	private Pager pager;
	private List<Role> roleList;
	private User user;
	private Role role;
	private String confirmPassword;
	private String result;
	private String userId;
	
	public String userManage(){
		String result = INPUT;
		HttpServletRequest request = ServletActionContext.getRequest();
		PageInfo pageInfo = new PageInfo();
		int startRow = 0;
		String pagerOffset = request.getParameter("pager.offset");
		int pageSize = 5;
		if (!StringUtils.isBlank(pagerOffset) && StringUtils.isNumeric(pagerOffset)) {
			startRow = Integer.parseInt(pagerOffset);
		}
	
		pageInfo.setStartRow(startRow);
		pageInfo.setPageSize(pageSize);
		try {
			PaginationResult<User> pageationResult = userService.getUserList(pageInfo);
			request.setAttribute("pageationResult", pageationResult);
			request.setAttribute("totalItems", pageationResult.getTotal());
			request.setAttribute("maxPageItems", 5);
			result = SUCCESS;
		} catch (Exception e) {
			logger.error("User Manage Error:" + e.getMessage());
		}
		return result;
	}
	
	public String editUser(){
		String result = INPUT;
		try {
			user = userService.getUserById(Integer.parseInt(userId));
			roleList = userService.getRoleList();
			result = SUCCESS;
		} catch (Exception e) {
			logger.error("Edit User Error:" + e.getMessage());
		}
		return result;
		
	}
	
	public String addUser(){
		String result = INPUT;
		try {
			roleList = userService.getRoleList();
			result = SUCCESS;
		} catch (Exception e) {
			logger.error("Add User Error:" + e.getMessage());
		}
		return result;
	}
	
	public String addUserSubmit(){
		try {
			user.setRole(role);
			userService.addUser(user);
			result = "true";
		} catch (Exception e) {
			logger.error("Add User Error:" + e.getMessage());
		}
		return SUCCESS;
	}
	
	public String deleteUser(){
		try {
			userService.deleteUser(Integer.parseInt(userId));
			result = "true";
		} catch (Exception e) {
			// TODO: handle exception
		}
		return SUCCESS;
	}
	
	public void validateAddUserSubmit(){
		if(user.getUserName().length() == 0 || "".equals(user.getUserName())){
			this.addFieldError("user.userName", "请输入用户名");
		}
		if(user.getPassword().length() == 0 || "".equals(user.getPassword())){
			this.addFieldError("user.password", "请输入密码");
		}
		if(confirmPassword.length() == 0 || "".equals(confirmPassword)){
			this.addFieldError("confirmPassword", "请确认密码");
		}else{
			if(!confirmPassword.equals(user.getPassword())){
				this.addFieldError("confirmPassword", "两次密码输入不一致");
			}
		}
		if(user.getEmail().length() == 0 || "".equals(user.getEmail())){
			this.addFieldError("user.email", "请输入邮箱");
		}
		if(role.getId() == 0){
			this.addFieldError("role.id", "请选择用户角色");
		}
	
	}
	
	public Pager getPager() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

	public List<Role> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Role getRole() {
		return role;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	
	
}
