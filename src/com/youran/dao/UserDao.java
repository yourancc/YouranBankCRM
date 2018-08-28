package com.youran.dao;

import com.youran.domain.User;

public interface UserDao extends BaseDao<User> {

	public User getUserByUserCode(String Usercode);

}
