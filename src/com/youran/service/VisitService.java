package com.youran.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.youran.domain.Visit;

public interface VisitService {

	List<Visit> getVisitList(DetachedCriteria dc);

	Boolean save(Visit visit);

	Long getTotal();

	Boolean updateVisit(Visit visit);

	Boolean deleteVisitById(Long delete_id);


}
