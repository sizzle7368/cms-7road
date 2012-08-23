package com.sz7road.web.dao.HibernateImpl;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.sz7road.web.common.util.HibernateUtil;
import com.sz7road.web.dao.UserDao;
import com.sz7road.web.model.user.User;

public class UserDaoHibernateImpl implements UserDao {

	private static final Logger logger = Logger.getLogger(UserDaoHibernateImpl.class);
	
	private static UserDaoHibernateImpl _instance = new UserDaoHibernateImpl();

	private UserDaoHibernateImpl() {}
	  
	public static UserDaoHibernateImpl getInstance() {
		return _instance;
	}
	
	@Override
	public User getUserByName(String userName) throws Exception {
		User user = new User();
		Session session = null;
		try {
			session = HibernateUtil.getSession();
			Criteria cri = session.createCriteria(User.class);
			cri.add(Restrictions.eq("userName", userName));
			user = (User)cri.uniqueResult();
		} catch (Exception e) {
			logger.error("Get User By Name Error :" + e.getMessage());
		}
		return user;
	}

}
