package com.sz7road.web.dao;

import java.util.List;

import com.sz7road.web.model.role.Role;

public interface RoleDao {

	public List<Role> getAllRoles() throws Exception;
	
	public Role getRoleById(int id) throws Exception;

}
