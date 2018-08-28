package com.youran.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.criterion.DetachedCriteria;

import com.youran.domain.Customer;

public interface CustomerDao extends BaseDao<Customer> {

	List getMapBySql(String sql);

}
