package com.youran.web;

import java.io.IOException;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.youran.domain.BaseDict;
import com.youran.service.BaseDictService;

public class BaseDictAction extends ActionSupport {
	private BaseDictService bds;
	private String dicTypeCode;
	public String getDicTypeCode() {
		return dicTypeCode;
	}

	public void setDicTypeCode(String dicTypeCode) {
		this.dicTypeCode = dicTypeCode;
	}

	public BaseDictService getBds() {
		return bds;
	}

	public void setBds(BaseDictService bds) {
		this.bds = bds;
	}

	
	//普通调用使用
	public String listDic() throws Exception {
		DetachedCriteria dc = DetachedCriteria.forClass(BaseDict.class);
		List<BaseDict> list = bds.listDic(dc);
		
		ActionContext.getContext().put("baseDictList", list);
		return "toList";
	}
	
	
	//ajax调用使用
	public String getListByTypeCode(){
		//.获取list对象
		DetachedCriteria dc = DetachedCriteria.forClass(BaseDict.class);
		//添加条件
		dc.add(Restrictions.eq("dict_type_code", dicTypeCode));
		List<BaseDict> list = bds.listDic(dc);
		//2.转换为json
		Gson gson = new Gson();
		String str_list = gson.toJson(list);
System.out.println(str_list);		
		//3.发送给浏览器
		ServletActionContext.getResponse().setContentType("application/json;charset=utf-8");
		try {
			ServletActionContext.getResponse().getWriter().write(str_list);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	
}
