package com.youran.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.youran.dao.BaseDictDao;
import com.youran.domain.BaseDict;
import com.youran.service.BaseDictService;

public class BaseDictServiceImpl implements BaseDictService {

	private BaseDictDao bdd;
	
	public BaseDictDao getBdd() {
		return bdd;
	}

	public void setBdd(BaseDictDao bdd) {
		this.bdd = bdd;
	}

	@Override
	public List<BaseDict> listDic(DetachedCriteria dc) {
		return bdd.getList(dc);
	}

}
