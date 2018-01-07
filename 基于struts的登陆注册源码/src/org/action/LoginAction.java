package org.action;

import java.util.Map;

import org.dao.DbService;
import org.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
@SuppressWarnings("serial")
public class LoginAction extends ActionSupport{
	private User user;//定义一个User类的对象

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	/*public String execute(){
		if(user.getUsername().equals("ky")&&user.getPassword().equals("123")){
			return SUCCESS;}
		else
			return ERROR;
	}*/
	
	//登陆方法login()
	public String login()throws Exception {
		/*if(user.getUsername().equals("ky")&&user.getPassword().equals("123")){
			System.out.print("name=ky");
			return SUCCESS;
		}
		if(user.getUsername().equals("zzzz")&&user.getPassword().equals("111")){
			System.out.print("name=zzzz");
			return SUCCESS;
		}
		else {
			System.out.print("name=error");
			return ERROR;
		}*/
		DbService dbService = new DbService();
		user = dbService.hasUser(user.getUsername(),user.getPassword());
		if(user.getUsername()==null) {
			this.addFieldError(user.getUsername(), "用户或密码不正确！");
			System.out.print("用户或密码不正确！\n");
			return "login_error";//登录失败
		} else {
			ActionContext actionContext = ActionContext.getContext();
			Map session = actionContext.getSession();
			session.put("user", user.getUsername());
		}
		return "login_success";//登陆成功
	}
	
	//注册方法regist()
	public String regist()throws Exception {
		User user_=new User();
		user_.setUsername(user.getUsername());
		user_.setPassword(user.getPassword());
		DbService dbService=new DbService();
		if(dbService.hasSameUser(user.getUsername())){
			this.addFieldError(user.getUsername(), "用户名已存在！");
			System.out.print("用户名已存在！\n");
			return "regist_error";//注册失败
		}
		else{
			dbService.addUser(user_);
		}
		return "regist_success";//注册成功
		}
	
}
