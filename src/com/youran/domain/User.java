package com.youran.domain;

import java.util.HashSet;
import java.util.Set;

public class User {
	private Long user_id;
	private String user_code;
	private String user_name;
	private String user_password;
	private String user_state;
	private String user_email;
	private Set<Visit> visits = new HashSet<Visit>();
	private Set<Chance> chances = new HashSet<Chance>();
	private String user_profile_photo;
	
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_profile_photo() {
		return user_profile_photo;
	}
	public void setUser_profile_photo(String user_profile_photo) {
		this.user_profile_photo = user_profile_photo;
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
	public void setVisits(Set<Visit> visit) {
		this.visits = visit;
	}
	public Long getUser_id() {
		return user_id;
	}
	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}
	public String getUser_code() {
		return user_code;
	}
	public void setUser_code(String user_code) {
		this.user_code = user_code;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_state() {
		return user_state;
	}
	public void setUser_state(String user_state) {
		this.user_state = user_state;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "实体类" + super.toString();
	}
	
}
