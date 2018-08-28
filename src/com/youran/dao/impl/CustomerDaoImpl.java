package com.youran.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;

import com.youran.dao.CustomerDao;
import com.youran.domain.Customer;

public class CustomerDaoImpl extends BaseDaoImpl<Customer> implements CustomerDao {

	@Override
	public List getMapBySql(String sql) {
		return getHibernateTemplate().execute(new HibernateCallback<List>() {

			@Override
			public List doInHibernate(Session session) throws HibernateException {
				SQLQuery createSQLQuery = session.createSQLQuery(sql);
				List list = createSQLQuery.list();
				return list;
			}
		});
	}

}
