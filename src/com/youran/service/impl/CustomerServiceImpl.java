package com.youran.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.BeanUtils;

import com.opensymphony.xwork2.ActionContext;
import com.youran.dao.BaseDictDao;
import com.youran.dao.CustomerDao;
import com.youran.domain.BaseDict;
import com.youran.domain.Customer;
import com.youran.domain.Linkman;
import com.youran.domain.User;
import com.youran.service.BaseDictService;
import com.youran.service.CustomerService;

public class CustomerServiceImpl implements CustomerService {
	private CustomerDao cd;
	private BaseDictDao bdd;
	public BaseDictDao getBdd() {
		return bdd;
	}
	public void setBdd(BaseDictDao bdd) {
		this.bdd = bdd;
	}
	public CustomerDao getCd() {
		return cd;
	}
	public void setCd(CustomerDao cd) {
		this.cd = cd;
	}
	@Override
	public List<Customer> getCustomerList(DetachedCriteria dc) {
		// TODO Auto-generated method stub
		return cd.getList(dc);
	}
	@Override
	public void saveCustomer(Customer customer) {
		User user = (User) ActionContext.getContext().getSession().get("user");
		customer.setCust_create_id(user.getUser_id());
		customer.setCust_user_id(user.getUser_id());
		cd.save(customer);
	}
	@Override
	public void updateCustomer(Customer customer) {
		//获得引用实体
		BaseDict tempDict = bdd.getById(customer.getCust_source().getDict_id());
		customer.setCust_source(tempDict);
		tempDict = bdd.getById(customer.getCust_industry().getDict_id());
		customer.setCust_industry(tempDict);
		tempDict = bdd.getById(customer.getCust_level().getDict_id());
		customer.setCust_level(tempDict);
		
		
		//绑定到里面去
		Customer old = getById(customer.getCust_id());
		BeanUtils.copyProperties(customer, old,new String[]{"cust_id","cust_state","cust_user_id","cust_create_id","cust_linkman","cust_phone","linkMens","visits"});

		cd.update(old);
	}
	@Override
	public Customer getById(Serializable id) {
		// TODO Auto-generated method stub
		return cd.getById(id);
	}
	@Override
	public Customer getByName(String name) {
		DetachedCriteria dc = DetachedCriteria.forClass(Customer.class);
		dc.add(Restrictions.eq("cust_name", name));
		
		List<Customer> custList = cd.getList(dc);
		
		if(custList.size()>0){
			return custList.get(0);
		}
		return null;
	}
	@Override
	public Boolean deleteCustomerById(Long delete_customer_id) {
		cd.delete(delete_customer_id);
		return true;
	}
	@Override
	public List customerIndustryList() {
		String sql = "SELECT dict_item_name,COUNT(*) FROM cst_customer,base_dict WHERE cst_customer.cust_industry = base_dict.`dict_id` GROUP BY dict_item_name";
		
		return cd.getMapBySql(sql);
	}
	@Override
	public List customerLevelList() {
		String sql = "SELECT dict_item_name,COUNT(*) c FROM cst_customer,base_dict WHERE cst_customer.cust_level = base_dict.`dict_id` GROUP BY dict_item_name ORDER BY c DESC";
		
		return cd.getMapBySql(sql);
	}
	@Override
	public Long getTotal() {
		DetachedCriteria dc = DetachedCriteria.forClass(Customer.class);
		return cd.getCount(dc).longValue();
		//return 1l;
	}

}
