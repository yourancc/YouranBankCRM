package com.youran.service;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.youran.domain.Linkman;

public interface LinkManService {

	List<Linkman> getLinkManList(DetachedCriteria dc);

	boolean save(Linkman linkman);

	boolean update(Linkman linkman);

	Linkman getById(Serializable id);
	
	Linkman getByName(String name);

	Boolean deleteLinkmanById(Long delete_id);

	Long getTotal();

	Long getTotalByGender(int i);
}
