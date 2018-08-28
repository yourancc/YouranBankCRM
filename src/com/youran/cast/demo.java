package com.youran.cast;
import javax.annotation.Resource;
import javax.servlet.ServletContext;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.stereotype.Component;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.youran.dao.UserDao;
import com.youran.domain.User;
import com.youran.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class demo {

	//private User user;
	
//	@Test
//	public  void testSpringBean(){
//		ServletContext sc = ServletActionContext.getServletContext();
//		WebApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(sc);
//		User user = (User) ac.getBean("user");
//		System.out.println(user.toString());
//	}
//	@Resource(name="sessionFactory")
//	private  SessionFactory sf;
//	@Test
//	public void testHibernate(){
//		//ServletContext sc = ServletActionContext.getServletContext();
//		//WebApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(sc);
//		//SessionFactory sf = (SessionFactory) ac.getBean("sessionFactory");
//		Session session = sf.openSession();
//		Transaction tc = session.beginTransaction();
//		//-----------------------------------------
//		
//		User u = new User();
//		u.setUser_name("lucy");
//		u.setUser_code("qqq");
//		u.setUser_password("123");
//		u.setUser_state("1");
//		session.save(u);
//		//-----------------------------------------		
//		tc.commit();
//		session.close();
//	}
//	@Resource(name="userDao")
//	private  UserDao ud;
//	@Test
//	public void  fun3(){
//		
//		User user = ud.getUserByUserCode("123");
//System.out.println(user);
//	}

	@Resource(name="userService")
	private UserService us;
	@Test
	public void fun4(){
		User u = new User();
		u.setUser_name("candy");
		u.setUser_code("qew");
		u.setUser_password("123");
		u.setUser_state("1");
		us.saveUser(u);
	}
}
