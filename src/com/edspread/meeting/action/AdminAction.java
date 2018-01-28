package com.edspread.meeting.action;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.StrutsStatics;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.edspread.meeting.constants.MeetingConstant;
import com.edspread.meeting.entity.User;
import com.edspread.meeting.service.UserService;
import com.edspread.meeting.util.ApplicationUtillty;
import com.edspread.meeting.util.MeetingException;
import com.edspread.meeting.util.SessionUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AdminAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userName;
	private String firstName;
	private String lastName;
	private String email;
	private String pwd;
	
	private String confPwd;

	

	private UserService userService;
	private ApplicationUtillty applicationUtillty;

	public AdminAction(UserService userService,ApplicationUtillty applicationUtillty) {
		this.userService = userService;
		this.applicationUtillty = applicationUtillty;
	}

	public String adminLogin() throws Exception {
		return SUCCESS;
	}
	
	
	
	
	
	public String execute() throws Exception {
		return SUCCESS;
	}
    
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
    public String validateAdminCredential() {

		try {
			User user = userService.validateUser(userName, pwd,
					MeetingConstant.ADMIN_USERTYPE);
			if (user == null) {
				addActionError("Invalid Credential");
				return ERROR;
			} else {
				SessionUtil.getSession().put(MeetingConstant.USER_SESSION_VAR,
						user);
			}
		} catch (MeetingException e) {
			addActionError("Error occured");
			e.printStackTrace();
			return ERROR;
		}

		return SUCCESS;

	}
}