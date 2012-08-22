package com.sz7road.web.model.permission;

public class Permission {

	private int id;
	private int parentId;
	private String permName;
	private String permDesc;
	private String permUrl;
	private String orderId;
	private boolean enable;
	private boolean isMenu;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	public String getPermName() {
		return permName;
	}
	public void setPermName(String permName) {
		this.permName = permName;
	}
	public String getPermDesc() {
		return permDesc;
	}
	public void setPermDesc(String permDesc) {
		this.permDesc = permDesc;
	}
	public String getPermUrl() {
		return permUrl;
	}
	public void setPermUrl(String permUrl) {
		this.permUrl = permUrl;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public boolean isEnable() {
		return enable;
	}
	public void setEnable(boolean enable) {
		this.enable = enable;
	}
	public boolean isMenu() {
		return isMenu;
	}
	public void setMenu(boolean isMenu) {
		this.isMenu = isMenu;
	}
}
