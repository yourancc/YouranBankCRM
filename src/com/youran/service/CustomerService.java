package com.youran.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.hibernate.criterion.DetachedCriteria;

import com.youran.domain.Customer;
import com.youran.domain.Linkman;

public interface CustomerService {

	List<Customer> getCustomerList(DetachedCriteria dc);

	void saveCustomer(Customer customer);

	void updateCustomer(Customer customer);
	
	Customer getById(Serializable id);

	Customer getByName(String name);

	Boolean deleteCustomerById(Long delete_customer_id);

	List customerIndustryList();

	List customerLevelList();

	Long getTotal();

}
