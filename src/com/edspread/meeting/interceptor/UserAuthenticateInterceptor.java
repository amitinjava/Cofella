package com.edspread.meeting.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.edspread.meeting.service.UserService;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class UserAuthenticateInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = 1L;
	private UserService userService;

	@SuppressWarnings("unchecked")
	public String intercept(ActionInvocation invocation) throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		Map<String, ? extends Object> session = invocation.getInvocationContext().getSession();
		/*User user = (User)session.get(MeetingConstant.USER_SESSION_VAR);
		//ActionContext ctx = invocation.getInvocationContext();
		if(user == null || user.getType() != MeetingConstant.USER_USERTYPE){
			return MeetingConstant.LOGIN;
		}else {
			String result = invocation.invoke();
			return result;
		}*/
		String result = invocation.invoke();
		return result;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	
}