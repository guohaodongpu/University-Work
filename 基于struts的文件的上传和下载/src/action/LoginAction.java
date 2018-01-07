package action;

import bean.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.UserDAO;
public class LoginAction extends ActionSupport {
	private User user;
	private String randomCode;
	public String execute() throws Exception {
		String randomCode = ActionContext.getContext().getSession()
				.get("randomCode") == null ? "" : ActionContext.getContext()
				.getSession().get("randomCode").toString();
		String randomCodePage = randomCode == null ? "" : randomCode;
		if (randomCode.equalsIgnoreCase((randomCodePage.trim()))) {
			user = new UserDAO().checkLogin(user.getUsername(),
					user.getPassword());
			if (user != null) {
				ActionContext.getContext().getSession().put("user", user);
				return "success";
			} else {
				return "login";
			}
		} else {
			return "login";
		}
	}
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getRandomCode() {
		return randomCode;
	}

	public void setRandomCode(String randomCode) {
		this.randomCode = randomCode;
	}

}