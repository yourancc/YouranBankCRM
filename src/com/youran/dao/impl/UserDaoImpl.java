package com.youran.dao.impl;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.youran.dao.UserDao;
import com.youran.domain.User;

public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {

	
	@Override
	public User getUserByUserCode(String usercode) {
		
		return getHibernateTemplate().execute(new HibernateCallback<User>() {

			@Override
			public User doInHibernate(Session session) throws HibernateException {
				String hql = "from User where user_code = ?";
				Query query = session.createQuery(hql);
				query.setParameter(0, usercode);
				User user = (User) query.uniqueResult();
				return user;
			}
		});
	}


}
