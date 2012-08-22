package com.sz7road.web.model.role;
import java.util.Set;
import com.sz7road.web.model.permission.Permission;
/**
 * 
 * @author hai.yuan
 *
 */
public class Role {

	private int id;
	private String roleName;
	private String roleDesc;
	private boolean enable;
	private Set<Permission> permissions;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getRoleDesc() {
		return roleDesc;
	}
	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}
	public boolean isEnable() {
		return enable;
	}
	public void setEnable(boolean enable) {
		this.enable = enable;
	}
	public Set<Permission> getPermissions() {
		return permissions;
	}
	public void setPermissions(Set<Permission> permissions) {
		this.permissions = permissions;
	}
	
}
