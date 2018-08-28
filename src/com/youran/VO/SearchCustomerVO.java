package com.youran.VO;

import com.google.gson.Gson;

public class SearchCustomerVO {
	private Long level;
	private Long source;
	private Long state;
	public Long getLevel() {
		return level;
	}
	public void setLevel(Long level) {
		this.level = level;
	}
	public Long getSource() {
		return source;
	}
	public void setSource(Long source) {
		this.source = source;
	}
	public Long getState() {
		return state;
	}
	public void setState(Long state) {
		this.state = state;
	}
	@Override
	public String toString() {
		Gson gson = new Gson();
		
		return gson.toJson(this);
	}
	
}
