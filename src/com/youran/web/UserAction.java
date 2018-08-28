package com.youran.web;

import java.net.HttpCookie;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.youran.domain.User;
import com.youran.service.UserService;

public class UserAction extends ActionSupport{

	private User user = new User();
	private User profile_user = new User();
	private UserService us;
	private User registerUser;
	private Long user_profile_id;
	public User getProfile_user() {
		return profile_user;
	}

	public void setProfile_user(User profile_user) {
		this.profile_user = profile_user;
	}

	public Long getUser_profile_id() {
		return user_profile_id;
	}

	public void setUser_profile_id(Long user_profile_id) {
		this.user_profile_id = user_profile_id;
	}

	public User getRegisterUser() {
		return registerUser;
	}

	public void setRegisterUser(User registerUser) {
		this.registerUser = registerUser;
	}

	public UserService getUs() {
		return us;
	}

	public void setUs(UserService us) {
		this.us = us;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String login(){
		
		User u = us.getUserByCidePassword(user);		
		if(u == null){
			return "toLogin";
		}
		
		Map<String, Object> sessionScope = ActionContext.getContext().getSession();
		sessionScope.put("user", u);
		return "success";
	} 
	
	public String register(){
		if(!us.saveUser(registerUser)){
			return "error";
		}
		
		Map<String, Object> sessionScope = ActionContext.getContext().getSession();
		sessionScope.put("user", registerUser);		
		return "success";
	}
	
	public String list() {
		DetachedCriteria dc = DetachedCriteria.forClass(User.class);
		List<User> userList = us.getUsers(dc);
//System.out.print("用户数量：" + userList.size());
		ActionContext.getContext().put("userList", userList);
		return "toList";
	}
	
	public String profile() {
//System.out.println("用户id" + user_profile_id);
		if(user_profile_id == null) {
			return "error";
		}
		DetachedCriteria dc = DetachedCriteria.forClass(User.class);
		dc.add(Restrictions.idEq(user_profile_id));
		List<User> profuile_user = us.getUsers(dc);
		
		if(profuile_user.size() == 1) {
			ActionContext.getContext().put("profile_user", profuile_user.get(0));
			return "toProfile";
		}
		
		return "error";
	}
	
	public String updateState() {
		
		if(profile_user==null || profile_user.getUser_id()== null) {
			return "error";
		}
		DetachedCriteria dc = DetachedCriteria.forClass(User.class);

		dc.add(Restrictions.idEq(profile_user.getUser_id()));
		//List<User> profuile_user = us.getUsers(dc);
		//更新对象状态
		profile_user = us.updateUserState(profile_user);		
		//if(profuile_user.size() == 1) {
			
			//ActionContext.getContext().put("profile_user", profuile_user.get(0));
			ActionContext.getContext().put("profile_user",profile_user);
			return "toProfile";
		//}
		//return "error";
	}
}
