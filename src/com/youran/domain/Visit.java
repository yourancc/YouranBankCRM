package com.youran.domain;

import java.util.Date;

public class Visit {
/*
 * visit_idvarchar(32) NOT NULL
visit_cust_idbigint(32) NULL客户id
visit_user_idbigint(32) NULL负责人id
visit_lkm_idbigint(32) NULL联系人id
visit_timedate NULL拜访时间
visit_addrvarchar(128) NULL拜访地点
visit_detailvarchar(256) NULL拜访详情
visit_nexttimedate NULL下次拜访时间
 * 
 * */
	private Long visit_id;
	private String visit_addr;
	private String visit_detail;
	private String visit_interviewee;
	private Date visit_time;
	private Date visit_nexttime;
	private Customer customer;
	private User user;
	private Linkman linkman;
	public Long getVisit_id() {
		return visit_id;
	}
	public void setVisit_id(Long visit_id) {
		this.visit_id = visit_id;
	}
	public String getVisit_addr() {
		return visit_addr;
	}
	public void setVisit_addr(String visit_addr) {
		this.visit_addr = visit_addr;
	}
	public String getVisit_detail() {
		return visit_detail;
	}
	public void setVisit_detail(String visit_detail) {
		this.visit_detail = visit_detail;
	}
	public String getVisit_interviewee() {
		return visit_interviewee;
	}
	public void setVisit_interviewee(String visit_interviewee) {
		this.visit_interviewee = visit_interviewee;
	}
	public Date getVisit_time() {
		return visit_time;
	}
	public void setVisit_time(Date visit_time) {
		this.visit_time = visit_time;
	}
	public Date getVisit_nexttime() {
		return visit_nexttime;
	}
	public void setVisit_nexttime(Date visit_nexttime) {
		this.visit_nexttime = visit_nexttime;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Linkman getLinkman() {
		return linkman;
	}
	public void setLinkman(Linkman linkman) {
		this.linkman = linkman;
	}

	
}
