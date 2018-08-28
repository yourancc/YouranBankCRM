package com.youran.VO;

import java.util.List;

import com.google.gson.Gson;

public class PandectVO {
	private Long totalUsers;
	private Long totalLinkmans;
	private Long totalWomanLinkmans;
	private Long totalManLinkmans;
	private Long totalVisits;
	private Long totalChances;
	private Long taotalCusomters;
	public Long getTaotalCusomters() {
		return taotalCusomters;
	}
	public void setTaotalCusomters(Long taotalCusomters) {
		this.taotalCusomters = taotalCusomters;
	}
	public Long getTotalUsers() {
		return totalUsers;
	}
	public void setTotalUsers(Long totalUsers) {
		this.totalUsers = totalUsers;
	}
	public Long getTotalLinkmans() {
		return totalLinkmans;
	}
	public void setTotalLinkmans(Long totalLinkmans) {
		this.totalLinkmans = totalLinkmans;
	}
	public Long getTotalWomanLinkmans() {
		return totalWomanLinkmans;
	}
	public void setTotalWomanLinkmans(Long totalWomanLinkmans) {
		this.totalWomanLinkmans = totalWomanLinkmans;
	}
	public Long getTotalManLinkmans() {
		return totalManLinkmans;
	}
	public void setTotalManLinkmans(Long totalManLinkmans) {
		this.totalManLinkmans = totalManLinkmans;
	}
	public Long getTotalVisits() {
		return totalVisits;
	}
	public void setTotalVisits(Long totalVisits) {
		this.totalVisits = totalVisits;
	}
	public Long getTotalChances() {
		return totalChances;
	}
	public void setTotalChances(Long totalChances) {
		this.totalChances = totalChances;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		Gson gson = new Gson();
		
		return gson.toJson(this);
	}
	
	
}
