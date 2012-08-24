package com.sz7road.web.service;

import com.sz7road.web.model.pagination.PageInfo;
import com.sz7road.web.model.pagination.PaginationResult;
import com.sz7road.web.model.user.User;

public interface UserManageService {

	public PaginationResult<User> getUserList(PageInfo pageInfo) throws Exception;

}
