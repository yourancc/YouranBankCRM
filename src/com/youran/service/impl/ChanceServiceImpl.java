package com.youran.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.opensymphony.xwork2.ActionContext;
import com.youran.dao.ChanceDao;
import com.youran.domain.Chance;
import com.youran.domain.Customer;
import com.youran.domain.Linkman;
import com.youran.domain.User;
import com.youran.service.ChanceService;
import com.youran.service.CustomerService;
import com.youran.service.LinkManService;

public class ChanceServiceImpl implements ChanceService {

	private ChanceDao ccd;
	private CustomerService cs;
	private LinkManService ls;
	public CustomerService getCs() {
		return cs;
	}

	public void setCs(CustomerService cs) {
		this.cs = cs;
	}

	public LinkManService getLs() {
		return ls;
	}

	public void setLs(LinkManService ls) {
		this.ls = ls;
	}

	@Override
	public List<Chance> list(DetachedCriteria dc) {
		// TODO Auto-generated method stub
		return ccd.getList(dc);
	}

	public ChanceDao getCcd() {
		return ccd;
	}

	public void setCcd(ChanceDao ccd) {
		this.ccd = ccd;
	}

	@Override
	public void saveChance(Chance chance) {
		Customer tempCustpmer = cs.getByName(chance.getCustomer().getCust_name());
		chance.setCustomer(tempCustpmer);
		
		Linkman tempLinkman = ls.getByName(chance.getLinkman().getLkm_name());
		chance.setLinkman(tempLinkman);
		
		User user = (User) ActionContext.getContext().getSession().get("user");
		chance.setUser(user);
		
		ccd.save(chance);
	}

	@Override
	public Long getTotal() {
		DetachedCriteria dc = DetachedCriteria.forClass(Chance.class);
		return ccd.getCount(dc).longValue();
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
