package com.youran.service.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.BeanUtils;

import com.youran.dao.CustomerDao;
import com.youran.dao.LinkManDao;
import com.youran.domain.Customer;
import com.youran.domain.Linkman;
import com.youran.service.CustomerService;
import com.youran.service.LinkManService;

public class LinkManServiceImpl implements LinkManService {

	private LinkManDao ld;
	private CustomerService cs;

	public CustomerService getCs() {
		return cs;
	}

	public void setCs(CustomerService cs) {
		this.cs = cs;
	}

	public LinkManDao getLd() {
		return ld;
	}

	public void setLd(LinkManDao ld) {
		this.ld = ld;
	}

	@Override
	public List<Linkman> getLinkManList(DetachedCriteria dc) {
		return ld.getList(dc);
	}

	@Override
	public boolean save(Linkman linkman) {
		//1.鑾峰彇瀹㈡埛瀵硅薄
		DetachedCriteria dc = DetachedCriteria.forClass(Customer.class);
		dc.add(Restrictions.eq("cust_name", linkman.getC().getCust_name()));
		List<Customer> list = cs.getCustomerList(dc);
		if(list == null){
			return false;
		}
		//2.缁戝畾瀹㈡埛鍒拌仈绯讳汉
		linkman.setC(list.get(0));
		//3.淇濆瓨鑱旂郴浜�
		ld.save(linkman);
		return true;
	}

	@Override
	public boolean update(Linkman linkman) {
		Linkman updateLinkMan;
		//2.鍒涘缓鏌ヨ鏉′欢		
		updateLinkMan = ld.getById(linkman.getLkm_id());
		//3.鎵ц鏌ヨ
		BeanUtils.copyProperties(linkman, updateLinkMan,new String[]{"lkm_id","c"});
		ld.update(updateLinkMan);;
		//ld.update(linkman);
		return true;
	}

	@Override
	public Linkman getById(Serializable id) {
		
		return ld.getById(id);
	}

	@Override
	public Linkman getByName(String name) {
		DetachedCriteria dc = DetachedCriteria.forClass(Linkman.class);
		dc.add(Restrictions.eq("lkm_name", name));
		
		List<Linkman> lkmList = ld.getList(dc);
		
		if(lkmList.size()>0){
			return lkmList.get(0);
		}
		return null;
	}

	@Override
	public Boolean deleteLinkmanById(Long delete_id) {
		ld.delete(delete_id);
		return true;
	}

	@Override
	public Long getTotal() {
		DetachedCriteria dc = DetachedCriteria.forClass(Linkman.class);
		return ld.getCount(dc).longValue();
	}

	@Override
	public Long getTotalByGender(int i) {
		DetachedCriteria dc = DetachedCriteria.forClass(Linkman.class);
		
		if(i==0){ //男
			dc.add(Restrictions.eq("lkm_gender", "男"));
		}else if(i==1) {//女
			dc.add(Restrictions.eq("lkm_gender", "女"));
		}
		
		return ld.getCount(dc).longValue();
	}

}
