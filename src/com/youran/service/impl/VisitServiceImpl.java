package com.youran.service.impl;

import java.util.List;

import javax.servlet.Registration;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ActionContext;
import com.youran.dao.VisitDao;
import com.youran.domain.Customer;
import com.youran.domain.Linkman;
import com.youran.domain.User;
import com.youran.domain.Visit;
import com.youran.service.CustomerService;
import com.youran.service.LinkManService;
import com.youran.service.VisitService;

public class VisitServiceImpl implements VisitService {

	private VisitDao vtd;
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

	public VisitDao getVtd() {
		return vtd;
	}

	public void setVtd(VisitDao vtd) {
		this.vtd = vtd;
	}

	@Override
	public List<Visit> getVisitList(DetachedCriteria dc) {
		return vtd.getList(dc);
	}

	@Override
	public Boolean save(Visit visit) {
		//获取用户，联系人，客户
		Customer tempCust = cs.getByName(visit.getCustomer().getCust_name());
		Linkman tempLinkman = ls.getByName(visit.getLinkman().getLkm_name());
		User tempUser =  (User) ActionContext.getContext().getSession().get("user"); 
		if(tempCust==null || tempLinkman==null || tempUser==null){
			return false;
		}
		//绑定
		visit.setCustomer(tempCust);
		visit.setLinkman(tempLinkman);
		visit.setUser(tempUser);
		vtd.save(visit);
		return true;
	}

	@Override
	public Long getTotal() {
		DetachedCriteria dc = DetachedCriteria.forClass(Visit.class);
		return vtd.getCount(dc).longValue();
	}

	@Override
	public Boolean updateVisit(Visit visit) {
		vtd.update(visit);
		return true;
	}

	@Override
	public Boolean deleteVisitById(Long delete_id) {
		vtd.delete(delete_id);
		return true;
	}


}
