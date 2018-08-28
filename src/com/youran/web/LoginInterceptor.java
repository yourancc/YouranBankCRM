package com.youran.web;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import com.youran.domain.User;
import com.youran.service.UserService;

public class LoginInterceptor extends MethodFilterInterceptor {



	@Override
	protected String doIntercept(ActionInvocation interceptor) throws Exception {
		User u = (User) ActionContext.getContext().getSession().get("user");
		if(u==null){
			return "toLogin";
		}
		ActionContext.getContext().put("user", u);
		return interceptor.invoke();
	}

}
