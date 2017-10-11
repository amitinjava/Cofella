package com.edspread.meeting.action;



import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.StrutsStatics;

import com.edspread.meeting.DTO.MeetingDTO;
import com.edspread.meeting.DTO.UserLectureDTO;
import com.edspread.meeting.constants.MeetingConstant;
import com.edspread.meeting.entity.Channel;
import com.edspread.meeting.entity.User;
import com.edspread.meeting.entity.UserLectures;
import com.edspread.meeting.service.ChannelService;
import com.edspread.meeting.service.ExMessageService;
import com.edspread.meeting.service.UserLectureService;
import com.edspread.meeting.service.UserService;
import com.edspread.meeting.util.ApplicationUtillty;
import com.edspread.meeting.util.DateUtil;
import com.edspread.meeting.util.JSONParserHelpers;
import com.edspread.meeting.util.MeetingException;
import com.edspread.meeting.util.SessionUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String lectureId;
    private String meetingName;
    private int channel_id;
	private List<String> meetings;
	private List<UserLectureDTO> lectureList;
	private List<Channel> channelList;
	private String oldFileName;
	private String fileName;
    private String userName;
	private String firstName;
	private String lastName;
	private String email;
	private String pwd;
	private String confPwd;
	private String actionName;
	private String errorMsg;
	private String message;
	private String autoPlay;
	private String timeZoneOffset;

	

	private UserService userService;
	private ChannelService channelService;
	private ExMessageService exMessageService;
	private UserLectureService userLectureService;
	private ApplicationUtillty applicationUtillty;

	public UserAction(UserService userService,UserLectureService userLectureService,ApplicationUtillty applicationUtillty, ChannelService channelService, ExMessageService exMessageService) {
		this.userService = userService;
		this.applicationUtillty = applicationUtillty;
		this.userLectureService = userLectureService;
		this.channelService = channelService;
		this.exMessageService = exMessageService;
	}

	public String execute() throws Exception {
		return SUCCESS;
	}
 
	/**
    * User login
    */
	public String userLogin() throws Exception {
		getallMeetingName();
		return SUCCESS;
	}
    
	/**
	* User Registration;
	*/

	public String showUserRegistration() {
		return SUCCESS;
	}
	
	public String test() {
		return SUCCESS;
	}
    
	/**
	* For creating New User;
	*/

	public String createUser() {
		return SUCCESS;
	}
    
	/**
	* User creating lectures;
	*/
    public String createLecture() {
		return SUCCESS;
	}
    
	/**
	* For showing the forgot password;
	*/
	
    public String showForgotPassword() {
		return SUCCESS;
	}
    
	/**
	* For editing the lectures;
	*/
    public String editLecture() {
		if(autoPlay.equalsIgnoreCase(MeetingConstant.TRUE)){
			return MeetingConstant.PLAY;
		}else{
			return SUCCESS;
		}
		
	}
    /**
	* For editing the lectures;
	*/
    public String editLecture2() {
		if(autoPlay.equalsIgnoreCase(MeetingConstant.TRUE)){
			return MeetingConstant.PLAY;
		}else{
			return SUCCESS;
		}
		
	}
    
	/**
	* For the User Profile Page;
	*/
    public String userProfile() {
		return SUCCESS;
		}
    
	/**
	* The User Registration action and validation;
	*/
     public String userRegistration() {
		try {
			if (firstName != null && email != null && pwd != null && lastName != null 
					&& firstName.trim().length() != 0 && lastName.trim().length() != 0
					&& email.trim().length() != 0 && pwd.trim().length() != 0 ) {
				if(!pwd.equals(confPwd)){
					 addActionError("Both password should be same.");
					return ERROR;
				 }
				List<User> userList = userService.findByEmail(email,
						MeetingConstant.USER_USERTYPE);
				if (userList != null && userList.size() > 0) {
					addActionError("User with this Email Id already exists,please try different one.");
					return ERROR;
				}
				User user = new User();
				user.setFirstName(firstName);
				user.setLastName(lastName);

				user.setEmail(email);
				user.setPassword(pwd);
				user.setActiveStatus(MeetingConstant.ACTIVE_STATUS);
				user.setType(MeetingConstant.USER_USERTYPE);
				userService.save(user);
				addActionMessage("User Created Successfully.Please login");
				return SUCCESS;
			} else {
				addActionError("User Name,Email & password can not be blank ");
				return ERROR;
			}
		} catch (Exception e) {
			e.printStackTrace();
			addActionError("Error Occured");
			return ERROR;
		}

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
    
	/**
	* For the forget password action and validation;
	*/  
  public String forgotPassword() {
		try {
		 if ( email != null && email.trim().length() != 0 ) {
			List<User> userList = userService.findByEmail(email,
					MeetingConstant.USER_USERTYPE);
			if (userList == null || userList.size() == 0) {
				addActionError("User with this Email doesn't exist.");
				return SUCCESS;
			}
		final List<String> toList = new ArrayList<String>();
		toList.add(email);
		final String link = MeetingConstant.FORGOT_PWD_LINK + "?email="+email;
		
		Thread thread = new Thread(new Runnable() {
			@Override
			public void run() {
				
				applicationUtillty.sendMail2Users(toList, link, "info@ttmac.com",
						"Edspread", "Validation Code", null);

			}
		});
		thread.start();
		addActionMessage("Reset link has been sent to your registered Email-Id");
		}else{
			addActionError("Email can not be blank.");
			return SUCCESS;
		}
		} catch (Exception e) {
			e.printStackTrace();
			addActionError("Error occured");
			return SUCCESS;
		}
		return SUCCESS;
	}
  
	/**
	* To set the action and validation for reset password;
	*/	
  public String setPassword() {
		try {
		 if ( email != null && email.trim().length() != 0 ) {
			 if(!pwd.equals(confPwd)){
				 addActionError("Both password's should be same.");
					return SUCCESS;
			 }
			 userService.updatePassword(email,pwd);
			 addActionMessage("Your Password has been changed. Please login to continue");
		}else{
			addActionError("Email can not be blank.");
			return SUCCESS;
		}
		} catch (Exception e) {
			e.printStackTrace();
			addActionError("Error occured");
			return SUCCESS;
		}
		return SUCCESS;
	}
  
	public int getChannel_id() {
		return channel_id;
	}

	public void setChannel_id(int channel_id) {
		this.channel_id = channel_id;
	}

	/**
	* For updating the user profile;
	*/
  public String updateUserProfile() {
		try {
			if (firstName != null && email != null && pwd != null && lastName != null 
					&& firstName.trim().length() != 0 && lastName.trim().length() != 0
					&& email.trim().length() != 0 && pwd.trim().length() != 0) {
				
				User user = (User) SessionUtil.getSession().get(MeetingConstant.USER_SESSION_VAR);
				user.setFirstName(firstName);
				user.setLastName(lastName);

				user.setEmail(email);
				user.setPassword(pwd);
				userService.updateUserProfile(user);
				addActionMessage("User Created Successfully.");
				return SUCCESS;
			} else {
				addActionError("User First Name,Last Name ,Email & password can not be blank ");
				return SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
			addActionError("Error Occured");
			return SUCCESS;
		}

	}
  
	/**
	* The validation for showing the reset password;
	*/	
  public String showResetPassword() {
		ActionContext context = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest)context.get(StrutsStatics.HTTP_REQUEST);
		email = (String) request.getAttribute("email");
		return SUCCESS;
	}
  
	/**
	* For getting the lectures;
	*/
  public String getallMeetingName() {
	String CONTEXT_PATH = SessionUtil.getServerDeploymentPath();
	User user = (User) SessionUtil.getSession().get(
			MeetingConstant.USER_SESSION_VAR);
	try {
		List<UserLectures>  userLectures = userLectureService.findByUser(user.getId());
		meetings = new ArrayList<String>();
		for (UserLectures userLecture : userLectures) {
			if(!userLecture.getLectureTitle().equals(meetingName)){
				meetings.add(userLecture.getLectureTitle());
			}else{
			
			}
			
		}
		
	} catch (MeetingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	/*
	File file = new File(CONTEXT_PATH + File.separator
			+ MeetingConstant.ENOTEBOOK + File.separator
			+ user.getEmail() + File.separator);
	String[] fileArray = file.list();
	if (fileArray != null) {
		meetings = new ArrayList<String>();
		for (int i = 0; i < fileArray.length; i++) {
			meetings.add(fileArray[i]);
		}
	}*/
	System.out.println("meetings:::::"+meetings);
	return SUCCESS;
 }
  
  
	/**
	* For getting the lectures;
	*/
public String getallLectureData() {
	User user = (User) SessionUtil.getSession().get(
			MeetingConstant.USER_SESSION_VAR);
	int offsetInMin = Integer.parseInt((String)SessionUtil.getSession().get(
			MeetingConstant.USER_TIMEZONE_OFFSET));
	offsetInMin = -(offsetInMin);
	
	if(meetingName != null){
		searchLecture();
		meetingName= null;
	}else{
			try {
				channelList = channelService.findByOwner(user.getEmail());
				System.out.println("channel size :: "+channelList.size());
				List<UserLectures> userLecturesList= userLectureService.findByUser(user.getId());
				lectureList = new ArrayList<UserLectureDTO>();
				for (UserLectures userLectures : userLecturesList) {
					UserLectureDTO userLectureDTO = new UserLectureDTO();
					userLectureDTO.setId(userLectures.getId());
					userLectureDTO.setLectureTitle(userLectures.getLectureTitle());
					userLectureDTO.setLectureDuration(userLectures.getLectureDuration());
					userLectureDTO.setSlides(userLectures.getSlides());;
					userLectureDTO.setUpdatedAt(DateUtil.getLectureFormattedDateTime(DateUtil.convertDateInUserTimeZone(userLectures.getUpdatedAt(), offsetInMin)));
					lectureList.add(userLectureDTO);
				}
				if(errorMsg != null){
					message = errorMsg;
					errorMsg = null;
				}
				
			} catch (MeetingException e) {
				e.printStackTrace();
			}
	}
	
	return SUCCESS;
}

  

public String renameLecture(){
	try {
		User user = (User) SessionUtil.getSession().get(MeetingConstant.USER_SESSION_VAR);
		String CONTEXT_PATH = SessionUtil.getServerDeploymentPath();
		String lecturePath = CONTEXT_PATH + File.separator
				+ MeetingConstant.ENOTEBOOK + File.separator
				+ user.getEmail() + File.separator
				+ meetingName;
		File fl = new File(lecturePath);
		/*
		if(fl.exists()){
			errorMsg = "Lecture Already Exists";
			actionName = MeetingConstant.RENAMELECACTION;
			return ERROR;
		}*/
	
		if(	userLectureService.findByUserAndTitle(meetingName, user.getId()) != null){
			errorMsg = "Lecture Already Exists";
			actionName = MeetingConstant.RENAMELECACTION;
			return ERROR;
		}else{
			String oldLecture = CONTEXT_PATH + File.separator
					+ MeetingConstant.ENOTEBOOK + File.separator
					+ user.getEmail() + File.separator
					+ oldFileName;
			File oldFile = new File(oldLecture);
			if(oldFile.renameTo(fl)){
				oldFile = new File(fl.getAbsolutePath() + File.separator + oldFileName
						+ MeetingConstant.JSONFORMAT);
				fl = new File(fl.getAbsolutePath() + File.separator + meetingName
						+ MeetingConstant.JSONFORMAT);
				 if(oldFile.renameTo(fl)){
					userLectureService.renameLectureInDB(user, oldFileName, meetingName);
					return SUCCESS;
				 }else{
					errorMsg = "Error Occured" ;
					actionName = MeetingConstant.RENAMELECACTION;
					return ERROR;
				}
			}else{
				errorMsg = "Error Occured";
				actionName = MeetingConstant.RENAMELECACTION;
				return ERROR;
			}
		}
	} catch (Exception e) {
		errorMsg = "Error Occured";
		actionName = MeetingConstant.RENAMELECACTION;
		return ERROR;
	}
}
public String duplicateLecture(){
	try {
		User user = (User) SessionUtil.getSession().get(MeetingConstant.USER_SESSION_VAR);
		String CONTEXT_PATH = SessionUtil.getServerDeploymentPath();
		String lecturePath = CONTEXT_PATH + File.separator
				+ MeetingConstant.ENOTEBOOK + File.separator
				+ user.getEmail() + File.separator
				+ meetingName;
		File fl = new File(lecturePath);
		/*if(fl.exists()){
			errorMsg = "Lecture Already Exists";
			actionName = MeetingConstant.DUPLICATELECACTION;
			return ERROR;
		}*/
		if(	userLectureService.findByUserAndTitle(meetingName, user.getId()) != null){
			errorMsg = "Lecture Already Exists";
			actionName = MeetingConstant.DUPLICATELECACTION;
			return ERROR;
		}else{
			String oldLecture = CONTEXT_PATH + File.separator
					+ MeetingConstant.ENOTEBOOK + File.separator
					+ user.getEmail() + File.separator
					+ oldFileName;
			if (applicationUtillty.copyDirectory(oldLecture, lecturePath)) {
				File oldFile = new File(fl.getAbsolutePath() + File.separator + oldFileName
						+ MeetingConstant.JSONFORMAT);
				fl = new File(fl.getAbsolutePath() + File.separator + meetingName
						+ MeetingConstant.JSONFORMAT);
				if(oldFile.renameTo(fl)){
					copyLectureDataInDB(user,meetingName,oldFileName);
					return SUCCESS;
				}else{
					errorMsg = "Error occured while copying file";
					actionName = MeetingConstant.DUPLICATELECACTION;
					return ERROR;
				}
			}else{
				errorMsg = "Error occured while copying file";
				actionName = MeetingConstant.DUPLICATELECACTION;
				return ERROR;
			}
		}
	} catch (Exception e) {
		errorMsg = "Error Occured";
		actionName = MeetingConstant.DUPLICATELECACTION;
		return ERROR;
	}
}


private void copyLectureDataInDB(User user,String meetingName,String oldFileName) throws MeetingException {
	UserLectures srcLecture =  userLectureService.findById(Integer.parseInt(lectureId));
	UserLectures userLectures = new UserLectures();
	userLectures.setLectureTitle(meetingName);
	userLectures.setLectureDuration(srcLecture.getLectureDuration());
	userLectures.setSlides(srcLecture.getSlides());
	userLectures.setActiveStatus((byte) 1);
	userLectures.setUser(user);
	userLectures.setCreatedAt(DateUtil.getCurrentDateTime());
	userLectures.setUpdatedAt(DateUtil.getCurrentDateTime());
	userLectureService.save(userLectures);
	
}

public String deleteLecture(){
	try {
		User user = (User) SessionUtil.getSession().get(MeetingConstant.USER_SESSION_VAR);
		String CONTEXT_PATH = SessionUtil.getServerDeploymentPath();
		String lecturePath = CONTEXT_PATH + File.separator
				+ MeetingConstant.ENOTEBOOK + File.separator
				+ user.getEmail() + File.separator
				+ meetingName;
		File fl = new File(lecturePath);
		FileUtils.deleteDirectory(fl);
		
		deleteLectureDataInDB();
		getallLectureData();
		return SUCCESS;
		
	} catch (Exception e) {
		e.printStackTrace();
		actionName = MeetingConstant.DELETELECACTION;
		errorMsg = "Error Occured";
		return ERROR;
	}
}

public String deleteRecordingFromLecture(){
	BufferedReader in = null;
	try {
		User user = (User) SessionUtil.getSession().get(MeetingConstant.USER_SESSION_VAR);
		String CONTEXT_PATH = SessionUtil.getServerDeploymentPath();
		String lecturePath = CONTEXT_PATH + File.separator
				+ MeetingConstant.ENOTEBOOK + File.separator
				+ user.getEmail() + File.separator
				+ meetingName;
		
		in  = new BufferedReader(new FileReader(lecturePath + File.separator + meetingName + MeetingConstant.JSONFORMAT ));
		String line;
		StringBuilder recievedXML = new StringBuilder();
		while ((line = in.readLine()) != null) {
			recievedXML.append(line);
		}
		String jsonContent = recievedXML.toString();
		MeetingDTO meetingDTO= JSONParserHelpers.getRequestFromJson(jsonContent);
		meetingDTO.setRecFname(null);
		meetingDTO.setTempRecFile(null);
		meetingDTO.setRecFileDuration(null);
		jsonContent = JSONParserHelpers.getRequestFromJson(meetingDTO);
			
		FileWriter	fw = new FileWriter(lecturePath + File.separator + meetingName + MeetingConstant.JSONFORMAT );
		BufferedWriter bw = new BufferedWriter(fw);
		bw.write(jsonContent);
		bw.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
		return ERROR;
	}finally{
		if(in != null)
			try {
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
				return ERROR;
			}
	}
	return SUCCESS;
	
	
}



public void deleteLectureDataInDB() throws NumberFormatException, MeetingException{
	UserLectures srcLecture =  userLectureService.findById(Integer.parseInt(lectureId));
	srcLecture.setActiveStatus((byte) 0);
	userLectureService.save(srcLecture);

}


public String searchLecture(){
	
	try {
		User user = (User) SessionUtil.getSession().get(MeetingConstant.USER_SESSION_VAR);
		List<UserLectures> userLecturesList= userLectureService.findByTitleAndUser(meetingName,user.getId());
		lectureList = new ArrayList<UserLectureDTO>();
		for (UserLectures userLectures : userLecturesList) {
			UserLectureDTO userLectureDTO = new UserLectureDTO();
			userLectureDTO.setId(userLectures.getId());
			userLectureDTO.setLectureTitle(userLectures.getLectureTitle());
			userLectureDTO.setLectureDuration(userLectures.getLectureDuration());
			userLectureDTO.setSlides(userLectures.getSlides());;
			userLectureDTO.setUpdatedAt(DateUtil.getLectureFormattedDateTime(userLectures.getUpdatedAt()));
			lectureList.add(userLectureDTO);
		}
		
	} catch (MeetingException e) {
		e.printStackTrace();
	}
	
	return SUCCESS;
	
}
   
	/**
	* The User Login action and validation;
	*/
	public String validateUserCredential() {

		try {
			User user = userService.validateUser(userName, pwd,
					MeetingConstant.USER_USERTYPE);
			if (user == null) {
				addActionError("Invalid Credential");
				return ERROR;
			} else {
				SessionUtil.getSession().put(MeetingConstant.USER_SESSION_VAR,
						user);
				SessionUtil.getSession().put(MeetingConstant.USER_TIMEZONE_OFFSET,
						timeZoneOffset);
				getallLectureData();
			}
		} catch (MeetingException e) {
			addActionError("Error occured");
			e.printStackTrace();
			return ERROR;
		}

		return SUCCESS;

	}
    
	/**
	* The User log out action and validation;
	*/	
	public String logoutUser() {
		SessionUtil.logout();
		return SUCCESS;
		
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public ChannelService getChannelService() {
		return channelService;
	}

	public void setChannelService(ChannelService channelService) {
		this.channelService = channelService;
	}

	public ExMessageService getExMessageService() {
		return exMessageService;
	}

	public void setExMessageService(ExMessageService exMessageService) {
		this.exMessageService = exMessageService;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public List<String> getMeetings() {
		return meetings;
	}

	public void setMeetings(List<String> meetings) {
		this.meetings = meetings;
	}

	public String getMeetingName() {
		return meetingName;
	}

	public void setMeetingName(String meetingName) {
		this.meetingName = meetingName;
	}

	public String getConfPwd() {
		return confPwd;
	}

	public void setConfPwd(String confPwd) {
		this.confPwd = confPwd;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public ApplicationUtillty getApplicationUtillty() {
		return applicationUtillty;
	}

	public void setApplicationUtillty(ApplicationUtillty applicationUtillty) {
		this.applicationUtillty = applicationUtillty;
	}

	public void setUserLectureService(UserLectureService userLectureService) {
		this.userLectureService = userLectureService;
	}

	public List<UserLectureDTO> getLectureList() {
		return lectureList;
	}

	public void setLectureList(List<UserLectureDTO> lectureList) {
		this.lectureList = lectureList;
	}

	public String getOldFileName() {
		return oldFileName;
	}

	public void setOldFileName(String oldFileName) {
		this.oldFileName = oldFileName;
	}

	public String getLectureId() {
		return lectureId;
	}

	public void setLectureId(String lectureId) {
		this.lectureId = lectureId;
	}

	public String getActionName() {
		return actionName;
	}

	public void setActionName(String actionName) {
		this.actionName = actionName;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getAutoPlay() {
		return autoPlay;
	}

	public void setAutoPlay(String autoPlay) {
		this.autoPlay = autoPlay;
	}

	public String getTimeZoneOffset() {
		return timeZoneOffset;
	}

	public void setTimeZoneOffset(String timeZoneOffset) {
		this.timeZoneOffset = timeZoneOffset;
	}

	public List<Channel> getChannelList() {
		return channelList;
	}

	public void setChannelList(List<Channel> channelList) {
		this.channelList = channelList;
	}
	
}