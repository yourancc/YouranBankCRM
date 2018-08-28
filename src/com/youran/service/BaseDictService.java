package com.youran.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.youran.domain.BaseDict;

public interface BaseDictService {

	List<BaseDict> listDic(DetachedCriteria dc);

}
