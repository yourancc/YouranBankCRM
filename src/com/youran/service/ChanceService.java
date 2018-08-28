package com.youran.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.youran.domain.Chance;

public interface ChanceService {

	List<Chance> list(DetachedCriteria dc);

	void saveChance(Chance chance);

	Long getTotal();

}
