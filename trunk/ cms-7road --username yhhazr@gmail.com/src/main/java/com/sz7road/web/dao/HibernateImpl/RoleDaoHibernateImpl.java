package com.sz7road.web.dao.HibernateImpl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.sz7road.web.common.util.HibernateUtil;
import com.sz7road.web.dao.RoleDao;
import com.sz7road.web.model.role.Role;

public class RoleDaoHibernateImpl implements RoleDao {

	private static final Logger logger = Logger.getLogger(RoleDaoHibernateImpl.class);
	
	private static RoleDaoHibernateImpl _instance = new RoleDaoHibernateImpl();

	private RoleDaoHibernateImpl() {}
	  
	public static RoleDaoHibernateImpl getInstance() {
		return _instance;
	}
	
	@Override
	public List<Role> getAllRoles() throws Exception {
		List<Role> roleList = new ArrayList<Role>();
		Session session = null;
		try {
			session = HibernateUtil.getSession();
			Criteria cri = session.createCriteria(Role.class);
			cri.add(Restrictions.eq("enable", true));
			roleList = cri.list();
		} catch (Exception e) {
			logger.error("Get All Roles Error: " + e.getMessage());
		} finally{
			if(session != null){
				session.close();
			}
		}
		return roleList;
	}

	@Override
	public Role getRoleById(int id) throws Exception {
		return (Role)HibernateUtil.get(Role.class, id);
	}

}
