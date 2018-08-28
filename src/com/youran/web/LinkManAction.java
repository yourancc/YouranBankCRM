package com.youran.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.youran.domain.Customer;
import com.youran.domain.Linkman;
import com.youran.service.CustomerService;
import com.youran.service.LinkManService;

public class LinkManAction {

	private Linkman linkman;
	private LinkManService ls;
	private CustomerService cs;
	private Long update_linkman_id;
	private Long delete_id;
	private String checkItemName;
	public String getCheckItemName() {
		return checkItemName;
	}
	public void setCheckItemName(String checkItemName) {
		this.checkItemName = checkItemName;
	}
	public Long getDelete_id() {
		return delete_id;
	}
	public void setDelete_id(Long delete_id) {
		this.delete_id = delete_id;
	}
	public Long getUpdate_linkman_id() {
		return update_linkman_id;
	}
	public void setUpdate_linkman_id(Long update_linkman_id) {
		this.update_linkman_id = update_linkman_id;
	}
	public CustomerService getCs() {
		return cs;
	}
	public void setCs(CustomerService cs) {
		this.cs = cs;
	}

	public Linkman getLinkman() {
		return linkman;
	}
	public void setLinkman(Linkman linkman) {
		this.linkman = linkman;
	}
	public LinkManService getLs() {
		return ls;
	}
	public void setLs(LinkManService ls) {
		this.ls = ls;
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
		//1.获取查询条件
		DetachedCriteria dc = DetachedCriteria.forClass(Linkman.class);
		//2.根据条件获取列表
		List<Linkman> list = ls.getLinkManList(dc);
		
		//3.回显数据 
		ActionContext.getContext().put("linkmanList", list);
		return "toList";
	}
	
	//添加功能
	public String add(){
		if(ls.save(linkman)){
			return "rToListAction";
		}
		return "addError";
		
	}
	
	//更新功能
	public String update(){
		ls.update(linkman);
		return "rToListAction";
	}
	
	//ajax 获取某个联系人
	public String getLinkManByID(){
		DetachedCriteria dc = DetachedCriteria.forClass(Linkman.class);
		dc.add(Restrictions.idEq(update_linkman_id));
		List<Linkman> list = ls.getLinkManList(dc);
		if(list != null){
			Linkman linkman = list.get(0);
			Customer c = new Customer();
			c.setCust_name(linkman.getC().getCust_name());
			linkman.setC(c);
			
			Gson gson = new Gson();
			String scr_linkman = gson.toJson(linkman);
System.out.println(scr_linkman);			
			ServletActionContext.getResponse().setContentType("application/json;charset=utf-8");
			try {
				ServletActionContext.getResponse().getWriter().write(scr_linkman);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
		
	}
	
	//ajax.删除对象
	public String deleteById(){
		//2.创建离线查询对象
		DetachedCriteria dc = DetachedCriteria.forClass(Linkman.class); 
		//3.封装查询条件
		dc.add(Restrictions.idEq(delete_id));
		//4.调用service查询方法
		System.out.println("--------------------------" + delete_id);		
		ls.deleteLinkmanById(delete_id);

		try {
			ServletActionContext.getResponse().getWriter().write("success");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "rToListAction";
		
	}
	

	//ajax和核对姓名元素
	public String checkName(){
		Linkman l = ls.getByName(checkItemName);
		PrintWriter writer = null; 
		ServletActionContext.getResponse().setContentType("html/text;charset=UTF-8");
		try {
			writer = ServletActionContext.getResponse().getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(l != null){
			writer.write(l.getLkm_name().toString());
		}	
		return null;
	}
}
