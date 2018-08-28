package com.youran.web;

import java.io.IOException;
import java.util.List;

import javax.swing.text.html.CSS;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.youran.domain.Chance;
import com.youran.domain.Customer;
import com.youran.domain.Linkman;
import com.youran.domain.User;
import com.youran.service.ChanceService;
import com.youran.service.UserService;

public class ChanceAction {
	
	private ChanceService ccs;
	private UserService us;
	private Chance chance;
	private Long update_chance_id;
	
	
	
	//跳转到添加页面
	public String toAddPage(){
		return "toAdd";
	} 
	//跳转到列表页面
	public String list(){
		User user = (User) ActionContext.getContext().get("user");
		if(user == null) {
			return "error";
		}
		
		DetachedCriteria dc = DetachedCriteria.forClass(Chance.class);
		
		if(user.getUser_state().equals("1")) {
			dc.add(Restrictions.eq("user",user));
		}

		
		List<Chance> list = ccs.list(dc);
		
		ActionContext.getContext().put("chanceList", list);
		return "toList";
	} 
	//跳转到分析页面
	public String analyse(){
		return "toAnalyse";
	}
	//添加线索
	public String add(){
		//2.调用保存方法
		ccs.saveChance(chance);
		//重定向到listAction
		return "rToListAction";
	}
	public String getChanceByID(){
		//1.获取查询条件

		//2.创建离线查询对象
		DetachedCriteria dc = DetachedCriteria.forClass(Chance.class); 
		//3.封装查询条件
		dc.add(Restrictions.idEq(update_chance_id));
		//4.调用service查询方法
		List<Chance> chanceList = ccs.list(dc);
		if(chanceList != null && chanceList.size()>0){
			Chance cc = chanceList.get(0);
			
			Customer tempCustomer = new Customer();
			tempCustomer.setCust_name(cc.getCustomer().getCust_name());
			cc.setCustomer(tempCustomer);
			
			Linkman tempLinkman = new Linkman();
			tempLinkman.setLkm_name(cc.getLinkman().getLkm_name());
			cc.setLinkman(tempLinkman);
			
			User tempUser = new User();
			tempUser.setUser_name(cc.getUser().getUser_name());
			cc.setUser(tempUser);
			Gson gson = new Gson();
			String str_chan = gson.toJson(chanceList.get(0));		
			ServletActionContext.getResponse().setContentType("application/json;charset=utf-8");	
			try {				
				ServletActionContext.getResponse().getWriter().write(str_chan);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
System.out.println(str_chan);
			//ActionContext.getContext().put("customer_edit", customerList.get(0));
		}

		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public Long getUpdate_chance_id() {
		return update_chance_id;
	}
	public void setUpdate_chance_id(Long update_chance_id) {
		this.update_chance_id = update_chance_id;
	}
	public Chance getChance() {
		return chance;
	}
	public void setChance(Chance chance) {
		this.chance = chance;
	}
	public ChanceService getCcs() {
		return ccs;
	}
	public void setCcs(ChanceService ccs) {
		this.ccs = ccs;
	}
	public UserService getUs() {
		return us;
	}
	public void setUs(UserService us) {
		this.us = us;
	}
	
}
