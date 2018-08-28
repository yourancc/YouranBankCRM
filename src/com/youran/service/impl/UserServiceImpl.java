package com.youran.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.youran.dao.UserDao;
import com.youran.domain.User;
import com.youran.service.UserService;
import com.youran.utils.MD5Utils;

public class UserServiceImpl implements UserService {

	
	private UserDao ud;
	
	public UserDao getUd() {
		return ud;
	}

	public void setUd(UserDao ud) {
		this.ud = ud;
	}

	@Override
	public User getUserByCidePassword(User u) {
		User exsitUser = null;
		if(u.getUser_code() == null){
			return null;
		}
		exsitUser = ud.getUserByUserCode(u.getUser_code() );
		if(exsitUser == null){
			return null;
		}
		if(!exsitUser.getUser_password().equals(MD5Utils.md5(u.getUser_password()))){
			return null;	
		}
		return exsitUser;
	}

	@Override
	public boolean saveUser(User user) {
		User eUser = ud.getUserByUserCode(user.getUser_code());
		if(eUser != null){
			return false;
		}
		user.setUser_password(MD5Utils.md5(user.getUser_password()));
		user.setUser_state("1");
		user.setUser_profile_photo("img/photo/user.png");
		ud.save(user);
		return true;
	}

	@Override
	public List<User> getUsers(DetachedCriteria dc) {
		return ud.getList(dc);
	}

	@Override
	public User updateUserState(User profile_user) {
		User user = ud.getById(profile_user.getUser_id());
		user.setUser_state(profile_user.getUser_state());
		return user;
	}

}
