package com.youran.web;

import org.hamcrest.CustomTypeSafeMatcher;
import org.hibernate.criterion.DetachedCriteria;

import com.opensymphony.xwork2.ActionContext;
import com.youran.VO.PandectVO;
import com.youran.domain.Linkman;
import com.youran.service.ChanceService;
import com.youran.service.CustomerService;
import com.youran.service.LinkManService;
import com.youran.service.UserService;
import com.youran.service.VisitService;

public class ConsoleAction {
	
	UserService us;
	CustomerService cs;
	LinkManService ls;
	VisitService vs;
	ChanceService ccs;
	
	//总览
	public String pandect(){
//		DetachedCriteria dc = DetachedCriteria.forClass(Linkman.class);
//		return ld.getCount(dc).longValue();
		PandectVO pvo = new PandectVO();
		pvo.setTaotalCusomters(cs.getTotal());
		pvo.setTotalLinkmans(ls.getTotal());
		pvo.setTotalVisits(vs.getTotal());
		pvo.setTotalChances(ccs.getTotal());
		pvo.setTotalManLinkmans(ls.getTotalByGender(0));
		pvo.setTotalWomanLinkmans(ls.getTotalByGender(1));
		System.out.println(pvo.toString());
		
		ActionContext.getContext().put("PandectVO", pvo);
		return "toPandect";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public UserService getUs() {
		return us;
	}

	public void setUs(UserService us) {
		this.us = us;
	}

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

	public VisitService getVs() {
		return vs;
	}

	public void setVs(VisitService vs) {
		this.vs = vs;
	}

	public ChanceService getCcs() {
		return ccs;
	}

	public void setCcs(ChanceService ccs) {
		this.ccs = ccs;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
