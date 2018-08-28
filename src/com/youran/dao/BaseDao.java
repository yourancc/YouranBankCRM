package com.youran.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

public interface BaseDao<T> {

	//保存对象
	void save(T t);
	//删除对象
	void delete(T t);
	//通过id删除对象
	void delete(Serializable id);
	//更新对象
	void update(T t);
	//通过id查找对象
	T getById(Serializable id);
	//获取对象总数
	Integer getCount(DetachedCriteria dc);
	//获得对象列表
	List<T> getList(DetachedCriteria dc,Integer start,Integer pageSize);
	//获得对象列表
	List<T> getList(DetachedCriteria dc);
	
	
	
	
}
