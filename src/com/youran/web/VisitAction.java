package com.youran.web;

import java.io.IOException;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.youran.domain.Customer;
import com.youran.domain.Linkman;
import com.youran.domain.Visit;
import com.youran.service.VisitService;

public class VisitAction {

	private Visit visit;
	private VisitService vts;
	private Long update_visit_id;
	private Long delete_id;
	public Long getDelete_id() {
		return delete_id;
	}
	public void setDelete_id(Long delete_id) {
		this.delete_id = delete_id;
	}
	public Long getUpdate_visit_id() {
		return update_visit_id;
	}
	public void setUpdate_visit_id(Long update_visit_id) {
		this.update_visit_id = update_visit_id;
	}
	public Visit getVisit() {
		return visit;
	}
	public void setVisit(Visit visit) {
		this.visit = visit;
	}
	public VisitService getVts() {
		return vts;
	}
	public void setVts(VisitService vts) {
		this.vts = vts;
	}
	//跳转到分析页面
	public String analyse(){
		return "toAnalyse";
	}
	//跳转到添加页面
	public String toAddPage(){

		return "toAdd";
	}
	//跳转到列表页面
	public String list(){
		DetachedCriteria dc = DetachedCriteria.forClass(Visit.class);
		List<Visit> list = vts.getVisitList(dc);
		
		ActionContext.getContext().put("visitList", list);
		
		return "toList";
	}
	//添加功能
	public String add(){
		
		if(vts.save(visit)){
			
			System.out.println("添加失败！");
		}
		
		return "rToListAction";
	}
	
	//ajax获取拜访记录
	public String getVisitByID() {
		// 1.获取查询条件
		// 2.创建离线查询对象
		DetachedCriteria dc = DetachedCriteria.forClass(Visit.class);
		// 3.封装查询条件
		dc.add(Restrictions.idEq(update_visit_id));
		// 4.调用service查询方法
		List<Visit> visitList = vts.getVisitList(dc);
		if (visitList != null && visitList.size() > 0) {
			Visit vs = visitList.get(0);
			Customer tempC = new Customer();
			tempC.setCust_name(vs.getCustomer().getCust_name());
			vs.setCustomer(tempC);
			Linkman tempL = new Linkman();
			tempL.setLkm_name(vs.getLinkman().getLkm_name());
			vs.setLinkman(tempL);
			vs.setUser(null);
			
			Gson gson = new Gson();
			String str_vs = gson.toJson(vs);
			ServletActionContext.getResponse().setContentType("application/json;charset=utf-8");
			try {
				ServletActionContext.getResponse().getWriter().write(str_vs);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(str_vs);
			// ActionContext.getContext().put("customer_edit",
			// customerList.get(0));
		}
		return null;
	}
	
	public String update() {
		vts.updateVisit(visit);
		
		return "rToListAction";
	}
	
	public String deleteById() {
		// 2.创建离线查询对象
		DetachedCriteria dc = DetachedCriteria.forClass(Visit.class);
		// 3.封装查询条件
		dc.add(Restrictions.idEq(delete_id));
		// 4.调用service查询方法
		vts.deleteVisitById(delete_id);
		try {
			ServletActionContext.getResponse().getWriter().write("success");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "rToListAction";
	}
}
