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
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.edspread.meeting.DTO.UserLectureDTO;
import com.edspread.meeting.constants.MeetingConstant;
import com.edspread.meeting.entity.User;
import com.edspread.meeting.entity.UserLectures;
import com.edspread.meeting.service.UserLectureService;
import com.edspread.meeting.service.UserService;
import com.edspread.meeting.util.ApplicationUtillty;
import com.edspread.meeting.util.DateUtil;
import com.edspread.meeting.util.MeetingException;
import com.edspread.meeting.util.SessionUtil;
import com.opensymphony.xwork2.ActionSupport;

public class HomeAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int pageCount;
	private String imageUrl;
	private String meetingName;
	private String jsonContent;
	private boolean status;
	private String fileName;
	private String oldFileName;
	private boolean isSaved;
	private String email;
	private String duration;
	private String slides;
	private String actionName;
	private String errorMsg;
	private List<UserLectureDTO> lectureList;
	private boolean isAppend;

	

	private UserService userService;
	private UserLectureService userLectureService;
	private ApplicationUtillty applicationUtillty;
	

	public HomeAction(UserService userService,UserLectureService userLectureService,ApplicationUtillty applicationUtillty) {
		this.userService = userService;
		this.applicationUtillty = applicationUtillty;
		this.userLectureService = userLectureService;
	}

	public String execute() throws Exception {
		return SUCCESS;
	}

    
	/**
	* The Rating of the pages;
	*/
    public String retrieveAllPage() {
		try {
			String googleDocViewerUrl = "https://docs.google.com/viewer";
			//String serverUrl = "http://www.topchalks.com/tc/";
			String serverUrl = MeetingConstant.SERVRDOWNLOADPATH;
			String requestUrl = googleDocViewerUrl + "?url=" + URLEncoder.encode(serverUrl	+ fileName ,"UTF-8")+"&a=gt";
			URL url = new URL(requestUrl.toString());
			
			BufferedReader in = new BufferedReader(new InputStreamReader(
					url.openStream()));
			String inputLine;
			StringBuilder recievedXML = new StringBuilder();
			System.out.println("-----RESPONSE START-----"+requestUrl);
			while ((inputLine = in.readLine()) != null) {
				System.out.println(inputLine);
				recievedXML.append(inputLine);
			}
			in.close();

			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			InputSource is = new InputSource();
			is.setCharacterStream(new StringReader(recievedXML.toString()));

			Document doc = db.parse(is);
			NodeList pageNum = doc.getElementsByTagName("page");
			imageUrl = serverUrl + fileName;
			pageCount = pageNum.getLength();
			System.out.println("-----RESPONSE END-----");
		} catch (Exception e) {
			e.printStackTrace();
			addActionError("Error Occured");
		}
		return SUCCESS;
	}

    /**
	* For the creation of lecture,its action and validation;
	*/
	public String createNewLecture() {
		if (fileName != null) {
			try {
				User user = (User) SessionUtil.getSession().get(
						MeetingConstant.USER_SESSION_VAR);
				String CONTEXT_PATH = SessionUtil.getServerDeploymentPath();
				String srcPath = CONTEXT_PATH + File.separator
						+ MeetingConstant.ENOTEBOOK + File.separator
						+ user.getEmail() + File.separator + fileName;
				email = user.getEmail();
				if(userLectureService.findByUserAndTitle(fileName, user.getId()) != null){
					errorMsg = "Lecture Already Exists";
					actionName = MeetingConstant.NEWLECTUREACTION;
					return ERROR;
				}else{
					File fl = new File(srcPath);
					if (!fl.exists()) {
						fl.mkdirs();
					}
					String content = "{\"MeetingName\":\"" + (fileName) + "\"}";
					fl = new File(fl.getAbsolutePath() + File.separator + fileName
							+ MeetingConstant.JSONFORMAT);
					FileWriter fw;
					fw = new FileWriter(fl.getAbsoluteFile());
					BufferedWriter bw = new BufferedWriter(fw);
					bw.write(content);
					bw.close();
					
					String recDirPath = CONTEXT_PATH + File.separator
							+ MeetingConstant.ENOTEBOOK + File.separator
							+ user.getEmail() + File.separator + fileName + File.separator
							+ MeetingConstant.RECORDING;
					fl = new File(recDirPath);
					fl.mkdirs();
					String recTempDirPath = CONTEXT_PATH + File.separator
							+ MeetingConstant.ENOTEBOOK + File.separator
							+ user.getEmail() + File.separator + fileName + File.separator
							+ MeetingConstant.TEMP;
					fl = new File(recTempDirPath);
					fl.mkdirs();
					saveLectureInDB(user, fileName);
				}
			} catch (Exception e) {
				e.printStackTrace();
				errorMsg ="Error Occured";
				actionName = MeetingConstant.NEWLECTUREACTION;
				//getallLectureData();
				return ERROR;
			}
			meetingName = fileName;
			return SUCCESS;
		}else {
			errorMsg = "File Name can not be null";
			actionName = MeetingConstant.NEWLECTUREACTION;
			getallLectureData();
			return ERROR;
		}
	}
	
	public String getallLectureData() {
		User user = (User) SessionUtil.getSession().get(
				MeetingConstant.USER_SESSION_VAR);
		try {
			List<UserLectures> userLecturesList= userLectureService.findByUser(user.getId());
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
	
	private void saveLectureInDB(User user,String lectureTitle)throws MeetingException {
		try {
			UserLectures userLectures = new UserLectures();
			userLectures.setLectureTitle(lectureTitle);
			userLectures.setLectureDuration("00:00");
			userLectures.setSlides(0);
			userLectures.setActiveStatus((byte) 1);
			userLectures.setUser(user);
			userLectures.setCreatedAt(DateUtil.getCurrentDateTime());
			userLectures.setUpdatedAt(DateUtil.getCurrentDateTime());
			userLectureService.save(userLectures);
		} catch(Exception e){
			e.printStackTrace();
		}
		
		
	}

	/**
	* For saving the Lectures;
	*/
	public String saveMeetingdata() {
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			StringBuffer jb = new StringBuffer();
			String line = null;
			try {
				BufferedReader reader = request.getReader();
				while ((line = reader.readLine()) != null)
					jb.append(line);
			} catch (Exception e) {
				e.printStackTrace();
			}

			String CONTEXT_PATH = SessionUtil.getServerDeploymentPath();
			Map<String, String> meetingData = getMeetingData(jb.toString());
			meetingName = meetingData.get(MeetingConstant.MEETINGNAME);
			User user = (User) SessionUtil.getSession().get(
					MeetingConstant.USER_SESSION_VAR);
			if (meetingName != null) {
				
				status = writeJSONFile(CONTEXT_PATH, meetingName,
						jb.toString(), user.getEmail());
			} else {
				addActionError("Error Occured while saving");
				return ERROR;
			}
			if (meetingData.get(MeetingConstant.RECFILENAME) != null
					&& meetingData.get(MeetingConstant.RECFILENAME).trim()
							.length() > 0) {
				// Delete all files in recording folder
				String destPath = CONTEXT_PATH + File.separator
						+ MeetingConstant.ENOTEBOOK + File.separator +user.getEmail() 
						+ File.separator + meetingName
						+ File.separator + MeetingConstant.RECORDING;
				File file = new File(destPath);
				if(file.exists() && file.isDirectory()) {
					File[] fileList = file.listFiles();
					for (File file2 : fileList) {	
						try {
								if (!FileUtils.deleteQuietly(file2)) {
									addActionError("Error occured while deleting file");
									return ERROR;
								}
							} catch (Exception e) {
								e.printStackTrace();
								addActionError("Error occured while deleting file");
								return ERROR;
			
							}
					}

				}
						
				
				
				System.out
						.println("--------------copy recording file--------------");
				String srcPath = CONTEXT_PATH + File.separator
						+ meetingData.get(MeetingConstant.TEMPRECFILENAME);
				/*
				String recDirPath = CONTEXT_PATH + File.separator
						+ MeetingConstant.ENOTEBOOK + File.separator
						+ user.getEmail() + File.separator + meetingName + File.separator
						+ MeetingConstant.RECORDING;
				File fl = new File(recDirPath);
				if (!fl.exists()) {
					fl.mkdirs();
					String destPath = recDirPath + File.separator + meetingName
							+ MeetingConstant.RECORDINGFILEFORMAT;
					if (!applicationUtillty.copyFile(srcPath, destPath)) {
						addActionError("Error Occured while saving recording");
						return ERROR;
					}
				}*/
				System.out.println("srcFile" + srcPath);
				/*String destPath = CONTEXT_PATH + File.separator
						+ MeetingConstant.ENOTEBOOK + File.separator
						+ user.getEmail() + File.separator + meetingName + File.separator
						+ MeetingConstant.RECORDING + File.separator + meetingName
						+ MeetingConstant.RECORDINGFILEFORMAT;
				*/
				destPath = CONTEXT_PATH + File.separator 
						+ meetingData.get(MeetingConstant.RECFILENAME);
				System.out.println("destFile" + destPath);
				if (!applicationUtillty.copyFile(srcPath, destPath)) {
					addActionError("Error Occured while saving recording");
					return ERROR;
				}
				
			}
			String lectureDuration = meetingData.get(MeetingConstant.RECFILEDURATION);
			String slides = meetingData.get(MeetingConstant.PAGELIST);
			System.out.println("Lecture Duration::----------------------->"+lectureDuration);
			if(lectureDuration== null){
				lectureDuration = "00:00"; 
			}if(slides == null){
				slides = "0";
			}
			updateLectureInDB(user,meetingName,lectureDuration,slides);
			
		} catch (Exception e) {
			e.printStackTrace();
			addActionError("Error Occured");
			return ERROR;
		}
		return SUCCESS;
	}
    
	private void updateLectureInDB(User user, String lectureTitle,String lectureDuration,String slides) throws MeetingException {
		userLectureService.updateLectureInDB(user,lectureTitle,lectureDuration,Integer.parseInt(slides));
	}

	/**
	* For deleting the lectures;
	*/
	public String deleteExistingRecordingFile() {
		/*
		String CONTEXT_PATH = SessionUtil.getServerDeploymentPath();
		String destPath = CONTEXT_PATH + File.separator
				+ MeetingConstant.ENOTEBOOK + File.separator + meetingName
				+ File.separator + MeetingConstant.RECORDING + File.separator
				+ meetingName + MeetingConstant.RECORDINGFILEFORMAT;
		File file = new File(destPath);
		if (file.exists()) {
			try {
				FileUtils.deleteQuietly(file);
			} catch (Exception e) {
				e.printStackTrace();
				addActionError("Error occured while deleting file");
				return ERROR;
			}

		}
		*/
		
		User user = (User) SessionUtil.getSession().get(
				MeetingConstant.USER_SESSION_VAR);
		String CONTEXT_PATH = SessionUtil.getServerDeploymentPath();
		String destPath = CONTEXT_PATH + File.separator
				+ MeetingConstant.ENOTEBOOK + File.separator +user.getEmail() 
				+ File.separator + meetingName
				+ File.separator + MeetingConstant.TEMP;
		File file = new File(destPath);
		if(file.exists() && file.isDirectory()) {
			File[] fileList = file.listFiles();
			for (File file2 : fileList) {	
				try {
						if (!FileUtils.deleteQuietly(file2)) {
							addActionError("Error occured while deleting file");
							return ERROR;
						}
					} catch (Exception e) {
						e.printStackTrace();
						addActionError("Error occured while deleting file");
						return ERROR;
	
					}
			}

		}
		fileName = meetingName + "_" + System.currentTimeMillis() + MeetingConstant.RECORDINGFILEFORMAT;
		return SUCCESS;
	}
    
	/**
	* For Recording the lectures;
	*/
	/*
	public String setRecordingEnv() {
		System.out.println("status::::" + status);
		String CONTEXT_PATH = SessionUtil.getServerDeploymentPath();
		String destPath = CONTEXT_PATH + File.separator
				+ MeetingConstant.ENOTEBOOK + File.separator + meetingName
				+ File.separator + MeetingConstant.RECORDING;
		File file = new File(destPath);
		if (file.exists() && file.isDirectory()) {
			File[] fl = file.listFiles();
			for (int i = 0; i < fl.length; i++) {
				try {
					if (!FileUtils.deleteQuietly(fl[i])) {
						addActionError("Error occured while deleting file");
						return ERROR;
					}
				} catch (Exception e) {
					e.printStackTrace();
					addActionError("Error occured while deleting file");
					return ERROR;

				}

			}

			destPath = file.getAbsolutePath() + File.separator + meetingName
					+ MeetingConstant.RECORDINGFILEFORMAT;
			String srcPath = CONTEXT_PATH + File.separator
					+ MeetingConstant.ENOTEBOOK + File.separator + meetingName
					+ File.separator + meetingName
					+ MeetingConstant.RECORDINGFILEFORMAT;
			File srcFile =  new File(srcPath);
			if(srcFile.exists()){
				if (!applicationUtillty.copyFile(srcPath, destPath)) {
					addActionError("Error occured while copying file");
					return ERROR;
				}
			}

		}
		status = true;
		return SUCCESS;
	}*/
	
	
	public String setRecordingEnv() {
		System.out.println("status::::" + status);
		/* User user = (User) SessionUtil.getSession().get(
				MeetingConstant.USER_SESSION_VAR);*/
		String CONTEXT_PATH = SessionUtil.getServerDeploymentPath();
		String destPath = CONTEXT_PATH + File.separator
				+ MeetingConstant.ENOTEBOOK + File.separator + email 
				+ File.separator + meetingName
				+ File.separator + MeetingConstant.TEMP;
		File file = new File(destPath);
		if(file.exists() && file.isDirectory()) {
			File[] fileList = file.listFiles();
			for (File file2 : fileList) {
				try {
					if (!FileUtils.deleteQuietly(file2)) {
						addActionError("Error occured while deleting file");
						return ERROR;
					}
				} catch (Exception e) {
					e.printStackTrace();
					addActionError("Error occured while deleting file");
					return ERROR;
	
				}
			}
		}
		
	    String srcPath = CONTEXT_PATH + File.separator
				+ MeetingConstant.ENOTEBOOK + File.separator
				+ email + File.separator + meetingName + File.separator
				+ MeetingConstant.RECORDING;
		File srcFile =  new File(srcPath);
		if(file.exists() && file.isDirectory()) {
			File[] fileList = srcFile.listFiles();
			for (File file2 : fileList) {
				srcPath = srcPath + File.separator +  file2.getName();
				destPath = destPath + File.separator +  file2.getName();
				if (!applicationUtillty.copyFile(srcPath, destPath)) {
					addActionError("Error occured while copying file");
					return ERROR;
				}
			}
		}
			
		status = true;
		return SUCCESS;
	}
	
    
	/**
	* For the copied recording lectures;
	*/
	public String copyRecordingFile() {
		User user = (User) SessionUtil.getSession().get(
				MeetingConstant.USER_SESSION_VAR);
		String CONTEXT_PATH = SessionUtil.getServerDeploymentPath();
		String srcPath = CONTEXT_PATH + File.separator + fileName;
		String newFileName =  meetingName + "_" + System.currentTimeMillis() + MeetingConstant.RECORDINGFILEFORMAT;
		String destPath = CONTEXT_PATH + File.separator
					+ MeetingConstant.ENOTEBOOK + File.separator +user.getEmail() 
					+ File.separator + meetingName
					+ File.separator + MeetingConstant.TEMP + File.separator + newFileName ;
		
		if (!applicationUtillty.copyFile(srcPath, destPath)) {
			addActionError("Error occured while copying file");
			return ERROR;
		}
		File fl = new File(srcPath);
		if (!FileUtils.deleteQuietly(fl)) {
			addActionError("Error occured while deleting file");
			return ERROR;
		}
		fileName = newFileName;
		return SUCCESS;
	}

	
		
	
	public Map<String, String> getMeetingData(String jsonContent) {
		Map<String, String> fileList = new HashMap<String, String>();
		System.out.println(jsonContent);
		JSONParser parser = new JSONParser();

		Object obj;
		try {
			obj = parser.parse(jsonContent);
			JSONObject jsonObject = (JSONObject) obj;
			if (jsonObject.get(MeetingConstant.MEETING) != null) {
				fileList.put(MeetingConstant.MEETINGNAME,
						jsonObject.get(MeetingConstant.MEETING).toString());
			}
			if (jsonObject.get(MeetingConstant.TEMPRECFILENAME) != null) {
				fileList.put(MeetingConstant.TEMPRECFILENAME,
						jsonObject.get(MeetingConstant.TEMPRECFILENAME)
								.toString());
			}
			if (jsonObject.get(MeetingConstant.RECFILENAME) != null) {
				fileList.put(MeetingConstant.RECFILENAME,
						jsonObject.get(MeetingConstant.RECFILENAME)
								.toString());
			}
			if (jsonObject.get(MeetingConstant.RECFILEDURATION) != null) {
				fileList.put(MeetingConstant.RECFILEDURATION,
						jsonObject.get(MeetingConstant.RECFILEDURATION)
								.toString());
			}
			JSONArray pageList= (JSONArray)jsonObject.get(MeetingConstant.PAGELIST);
			if (pageList != null ) {
				fileList.put(MeetingConstant.PAGELIST,""+
						pageList.size()
								);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println("fileList:::" + fileList);
		return fileList;
	}
    
	/**
	* For the json file ;
	*/
	public boolean writeJSONFile(String path, String meetingName,
			String content, String name) {
		File file = new File(path + File.separator + MeetingConstant.ENOTEBOOK
				+ File.separator + name + File.separator + meetingName);
		// if dir doesn't exists, then create it
		if (!file.exists()) {
			file.mkdirs();
		}
		System.out.println("Path:::" + file.getAbsolutePath());
		file = new File(file.getAbsolutePath() + File.separator + meetingName
				+ MeetingConstant.JSONFORMAT);
		FileWriter fw;
		try {
			fw = new FileWriter(file.getAbsoluteFile());
			BufferedWriter bw = new BufferedWriter(fw);
			bw.write(content);
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		return true;

	}
    
	public String retrieveMeetingjson() {
		String CONTEXT_PATH = SessionUtil.getServerDeploymentPath();
		System.out.println("CONTEXT_PATH::" + CONTEXT_PATH);
		/*User user = (User) SessionUtil.getSession().get(
				MeetingConstant.USER_SESSION_VAR);*/
		File file = new File(CONTEXT_PATH + File.separator
				+ MeetingConstant.ENOTEBOOK + File.separator
				+ email + File.separator + meetingName
				+ File.separator + meetingName + MeetingConstant.JSONFORMAT);
		System.out.println("MeetingPath:::"+file.getAbsolutePath());
		if (!file.exists()) {
			addActionError("Meeting Not Found");
			return ERROR;
		} else {
			BufferedReader in = null;
			try {
				in = new BufferedReader(new FileReader(file));
				String line;
				StringBuilder recievedXML = new StringBuilder();
				while ((line = in.readLine()) != null) {
					recievedXML.append(line);
				}
				jsonContent = recievedXML.toString();
				isAppend = true;
				if (setRecordingEnv().equals(ERROR)) {
					addActionError("Error occured while copying recording file.");
					return ERROR;
				}
				/*
				 * HttpServletResponse response =
				 * ServletActionContext.getResponse();
				 * response.setContentType("application/json");
				 * response.getWriter().write(jsonContent );
				 */
				System.out.println("-----JSON Content-Found----");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				if (in != null) {
					try {
						in.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}

		}
		return SUCCESS;
	}
	
	
	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getMeetingName() {
		return meetingName;
	}

	public void setMeetingName(String meetingName) {
		this.meetingName = meetingName;
	}

	public String getJsonContent() {
		return jsonContent;
	}

	public void setJsonContent(String jsonContent) {
		this.jsonContent = jsonContent;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	

	
	public boolean isSaved() {
		return isSaved;
	}

	public void setSaved(boolean isSaved) {
		this.isSaved = isSaved;
	}

	public String getOldFileName() {
		return oldFileName;
	}

	public void setOldFileName(String oldFileName) {
		this.oldFileName = oldFileName;
	}
    
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public ApplicationUtillty getApplicationUtillty() {
		return applicationUtillty;
	}

	public void setApplicationUtillty(ApplicationUtillty applicationUtillty) {
		this.applicationUtillty = applicationUtillty;
	}

	public UserLectureService getUserLectureService() {
		return userLectureService;
	}

	public void setUserLectureService(UserLectureService userLectureService) {
		this.userLectureService = userLectureService;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getSlides() {
		return slides;
	}

	public void setSlides(String slides) {
		this.slides = slides;
	}

	public String getActionName() {
		return actionName;
	}

	public void setActionName(String actionName) {
		this.actionName = actionName;
	}

	public List<UserLectureDTO> getLectureList() {
		return lectureList;
	}

	public void setLectureList(List<UserLectureDTO> lectureList) {
		this.lectureList = lectureList;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public boolean isAppend() {
		return isAppend;
	}

	public void setAppend(boolean isAppend) {
		this.isAppend = isAppend;
	}
}
