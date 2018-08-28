package com.youran.domain;

import java.util.HashSet;
import java.util.Set;

import com.google.gson.Gson;

public class Customer {
	private Long cust_id;
	private String cust_name;
	private Long cust_user_id;
	private Long cust_create_id;
	private String cust_linkman; 
	private String cust_phone;
	private String cust_mobile;
	private Set<Linkman> linkMens = new HashSet<Linkman>();
	private Set<Visit> visits = new HashSet<Visit>();
	private Set<Chance> chances = new HashSet<Chance>();
	private BaseDict cust_source = new BaseDict();
	private BaseDict cust_industry = new BaseDict();
	private BaseDict cust_level = new BaseDict();		
	private BaseDict cust_state = new BaseDict();
	public BaseDict getCust_state() {
		return cust_state;
	}

	public void setCust_state(BaseDict cust_state) {
		this.cust_state = cust_state;
	}

	public Set<Chance> getChances() {
		return chances;
	}

	public void setChances(Set<Chance> chances) {
		this.chances = chances;
	}
	public Set<Visit> getVisits() {
		return visits;
	}

	public void setVisits(Set<Visit> visits) {
		this.visits = visits;
	}
	public BaseDict getCust_source() {
		return cust_source;
	}

	public void setCust_source(BaseDict cust_source) {
		this.cust_source = cust_source;
	}

	public BaseDict getCust_industry() {
		return cust_industry;
	}

	public void setCust_industry(BaseDict cust_industry) {
		this.cust_industry = cust_industry;
	}

	public BaseDict getCust_level() {
		return cust_level;
	}

	public void setCust_level(BaseDict cust_level) {
		this.cust_level = cust_level;
	}

	
	
	
	public Customer()
	{
		super();
	}
	
	public Set<Linkman> getLinkMens() {
		return linkMens;
	}
	public void setLinkMens(Set<Linkman> linkMens) {
		this.linkMens = linkMens;
	}
	public Long getCust_id() {
		return cust_id;
	}
	public void setCust_id(Long cust_id) {
		this.cust_id = cust_id;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	public Long getCust_user_id() {
		return cust_user_id;
	}
	public void setCust_user_id(Long cust_user_id) {
		this.cust_user_id = cust_user_id;
	}
	public Long getCust_create_id() {
		return cust_create_id;
	}
	public void setCust_create_id(Long cust_create_id) {
		this.cust_create_id = cust_create_id;
	}
	public String getCust_linkman() {
		return cust_linkman;
	}
	public void setCust_linkman(String cust_linkman) {
		this.cust_linkman = cust_linkman;
	}
	public String getCust_phone() {
		return cust_phone;
	}
	public void setCust_phone(String cust_phone) {
		this.cust_phone = cust_phone;
	}
	public String getCust_mobile() {
		return cust_mobile;
	}
	public void setCust_mobile(String cust_mobile) {
		this.cust_mobile = cust_mobile;
	}
	@Override
	public String toString() {
//		Gson gson = new Gson();
//		String s = gson.toJson(this);
		String s = "name:" + getCust_name() + "source:" + getCust_source() + "level:" + getCust_level();
		return s;
	}
	
	
}
