package com.youran.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.youran.VO.SearchCustomerVO;
import com.youran.domain.BaseDict;
import com.youran.domain.Customer;
import com.youran.service.CustomerService;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class CustomerAction extends ActionSupport {

	// 所需资源：ajax查找姓名是否存在
	private String checkItemName;
	private SearchCustomerVO searchVO;
	public SearchCustomerVO getSearchVO() {
		return searchVO;
	}

	public void setSearchVO(SearchCustomerVO searchVO) {
		this.searchVO = searchVO;
	}

	public String getCheckItemName() {
		return checkItemName;
	}

	public void setCheckItemName(String checkItemName) {
		this.checkItemName = checkItemName;
	}

	// 资源所需：获得客户列表
	private CustomerService cs;

	public CustomerService getCs() {
		return cs;
	}

	public void setCs(CustomerService cs) {
		this.cs = cs;
	}

	// 资源所需：添加客户功能
	private Customer customer = new Customer();

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	// 资源所需:根据id查找客户
	private Long update_customer_id;

	public Long getUpdate_customer_id() {
		return update_customer_id;
	}

	public void setUpdate_customer_id(Long update_customer_id) {
		this.update_customer_id = update_customer_id;
	}

	private Long delete_id;

	public Long getDelete_id() {
		return delete_id;
	}

	public void setDelete_id(Long delete_id) {
		this.delete_id = delete_id;
	}

	// 列出客户
	public String list() {
		// 1.获取查询条件
		// 2.创建离线查询对象
		DetachedCriteria dc = DetachedCriteria.forClass(Customer.class);
		// 3.封装查询条件
		if(searchVO != null){
			if(searchVO.getLevel()!= null && searchVO.getLevel()>0){
				BaseDict bd = new BaseDict();
				bd.setDict_id(searchVO.getLevel().toString());
				dc.add(Restrictions.eq("cust_level",bd));
			}
			if(searchVO.getSource()!= null && searchVO.getSource()>0){
				BaseDict bd = new BaseDict();
				bd.setDict_id(searchVO.getSource().toString());
				dc.add(Restrictions.eq("cust_source",bd));
			}
			if(searchVO.getState()!= null && searchVO.getState()>0){
				BaseDict bd = new BaseDict();
				bd.setDict_id(searchVO.getState().toString());
				dc.add(Restrictions.eq("cust_state",bd));
			}
		}
		// 4.调用service查询方法
		List<Customer> customerList = cs.getCustomerList(dc);
		// 5.将结果添加到request域
		System.out.println("WEB:" + customerList.size());
		ActionContext.getContext().put("customerList", customerList);
		ActionContext.getContext().put("searchVO", searchVO);
		// 6.返回
		return "list";

	}

	// 跳转到添加页面
	public String toAddPage() {
		return "toAdd";
	}

	// 添加 客户
	public String add() {
		// 1.获取对象
		// 2.调用service方法保存对象
		cs.saveCustomer(customer);
		// return "addSuccess";
		return "disToListAction";
	}

	public String update() {
System.out.println(customer.toString());;
		// 1.获取对象
		// 2.调用service方法
		cs.updateCustomer(customer);
		return "disToListAction";
	}

	// ajax----根据id查找客户
	public String getCustomerByID() {
		// 1.获取查询条件
		// 2.创建离线查询对象
		DetachedCriteria dc = DetachedCriteria.forClass(Customer.class);
		// 3.封装查询条件
		dc.add(Restrictions.idEq(update_customer_id));
		// 4.调用service查询方法
		List<Customer> customerList = cs.getCustomerList(dc);
		if (customerList != null && customerList.size() > 0) {
			Customer cc = customerList.get(0);
			cc.setLinkMens(null);
			cc.setVisits(null);
			Gson gson = new Gson();
			String str_cust = gson.toJson(customerList.get(0));
			ServletActionContext.getResponse().setContentType("application/json;charset=utf-8");
			try {
				ServletActionContext.getResponse().getWriter().write(str_cust);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(str_cust);
			// ActionContext.getContext().put("customer_edit",
			// customerList.get(0));
		}

		// 6.返回
		return null;
	}

	// ajax----根据id删除客户
	public String deleteById() {
		// 2.创建离线查询对象
		DetachedCriteria dc = DetachedCriteria.forClass(Customer.class);
		// 3.封装查询条件
		dc.add(Restrictions.idEq(delete_id));
		// 4.调用service查询方法
		cs.deleteCustomerById(delete_id);
		try {
			ServletActionContext.getResponse().getWriter().write("success");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "disToListAction";
	}

	// ajax和核对姓名元素
	public String checkName() {
		Customer c = cs.getByName(checkItemName);
		PrintWriter writer = null;
		ServletActionContext.getResponse().setContentType("html/text;charset=UTF-8");
		try {
			writer = ServletActionContext.getResponse().getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (c != null) {
			writer.write(c.getCust_name().toString());
		}
		return null;
	}

	// ajax客户行业分析
	public String customerIndustryList() {
		List list = cs.customerIndustryList();
		PrintWriter writer = null;
		ServletActionContext.getResponse().setContentType("application/json;charset=UTF-8");
		try {
			writer = ServletActionContext.getResponse().getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (list != null) {
			Gson gson = new Gson();
			String src_list = gson.toJson(list);
			writer.write(src_list);
		}
		return null;
	}

	// ajax客户行业分析
	public String customerLevelList() {
		List list = cs.customerLevelList();
		PrintWriter writer = null;
		ServletActionContext.getResponse().setContentType("application/json;charset=UTF-8");
		try {
			writer = ServletActionContext.getResponse().getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (list != null) {
			Gson gson = new Gson();
			String src_list = gson.toJson(list);
			writer.write(src_list);
		}
		return null;
	}

}
