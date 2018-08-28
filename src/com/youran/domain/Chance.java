package com.youran.domain;

import java.util.Date;

public class Chance {
	private Long chan_id;
	private String chan_name;
	private Long chan_money;
	private String chan_source;
	private String chan_state;
	private Date chan_linktime;
	private String chan_desc;
	
	private BaseDict chan_type = new BaseDict();
	private Customer customer;
	private User user;
	private Linkman linkman; 

	
	
	
	public BaseDict getChan_type() {
		return chan_type;
	}
	public void setChan_type(BaseDict chan_type) {
		this.chan_type = chan_type;
	}
	public Long getChan_id() {
		return chan_id;
	}
	public void setChan_id(Long chan_id) {
		this.chan_id = chan_id;
	}
	public String getChan_name() {
		return chan_name;
	}
	public void setChan_name(String chan_name) {
		this.chan_name = chan_name;
	}
	public Long getChan_money() {
		return chan_money;
	}
	public void setChan_money(Long chan_money) {
		this.chan_money = chan_money;
	}
	public String getChan_source() {
		return chan_source;
	}
	public void setChan_source(String chan_source) {
		this.chan_source = chan_source;
	}
	public String getChan_state() {
		return chan_state;
	}
	public void setChan_state(String chan_state) {
		this.chan_state = chan_state;
	}
	public Date getChan_linktime() {
		return chan_linktime;
	}
	public void setChan_linktime(Date chan_linktime) {
		this.chan_linktime = chan_linktime;
	}
	public String getChan_desc() {
		return chan_desc;
	}
	public void setChan_desc(String chan_desc) {
		this.chan_desc = chan_desc;
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
