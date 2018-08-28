package com.youran.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.youran.domain.User;

public interface UserService {
	
	public User getUserByCidePassword(User u);
	
	public boolean  saveUser(User user );

	public List<User> getUsers(DetachedCriteria dc);

	public User updateUserState(User user);
}
