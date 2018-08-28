package com.youran.domain;

import java.util.HashSet;
import java.util.Set;

public class Linkman {

	private Long lkm_id; //bigint(32) NOT NULL联系人编号(主键)
	private String lkm_name; //varchar(16) NULL联系人姓名
	private Long lkm_cust_id; //bigint(32) NOT NULL客户id
	private String lkm_gender; //char(1) NULL联系人性别
	private String lkm_phone; //varchar(16) NULL联系人办公电话
	private String lkm_mobile; //varchar(16) NULL联系人手机
	private String lkm_email; //varchar(64) NULL联系人邮箱
	private String lkm_qq; //varchar(16) NULL联系人qq
	private String lkm_position; //varchar(16) NULL联系人职位
	private String lkm_memo; //varchar(512) NULL联系人备注
	private Customer c = new Customer();
	private Set<Visit> visits = new HashSet<Visit>();
	private Set<Chance> chances = new HashSet<Chance>();
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public Set<Chance> getChances() {
		return chances;
	}
	public void setChances(Set<Chance> chances) {
		this.chances = chances;
	}
	public Customer getC() {
		return c;
	}
	public void setC(Customer c) {
		this.c = c;
	}
	public Set<Visit> getVisits() {
		return visits;
	}
	public void setVisits(Set<Visit> visits) {
		this.visits = visits;
	}
	public Long getLkm_id() {
		return lkm_id;
	}
	public void setLkm_id(Long lkm_id) {
		this.lkm_id = lkm_id;
	}
	public String getLkm_name() {
		return lkm_name;
	}
	public void setLkm_name(String lkm_name) {
		this.lkm_name = lkm_name;
	}
	public Long getLkm_cust_id() {
		return lkm_cust_id;
	}
	public void setLkm_cust_id(Long lkm_cust_id) {
		this.lkm_cust_id = lkm_cust_id;
	}
	public String getLkm_gender() {
		return lkm_gender;
	}
	public void setLkm_gender(String lkm_gender) {
		this.lkm_gender = lkm_gender;
	}
	public String getLkm_phone() {
		return lkm_phone;
	}
	public void setLkm_phone(String lkm_phone) {
		this.lkm_phone = lkm_phone;
	}
	public String getLkm_mobile() {
		return lkm_mobile;
	}
	public void setLkm_mobile(String lkm_mobile) {
		this.lkm_mobile = lkm_mobile;
	}
	public String getLkm_email() {
		return lkm_email;
	}
	public void setLkm_email(String lkm_email) {
		this.lkm_email = lkm_email;
	}
	public String getLkm_qq() {
		return lkm_qq;
	}
	public void setLkm_qq(String lkm_qq) {
		this.lkm_qq = lkm_qq;
	}
	public String getLkm_position() {
		return lkm_position;
	}
	public void setLkm_position(String lkm_position) {
		this.lkm_position = lkm_position;
	}
	public String getLkm_memo() {
		return lkm_memo;
	}
	public void setLkm_memo(String lkm_memo) {
		this.lkm_memo = lkm_memo;
	}

	
}
