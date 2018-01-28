package com.edspread.meeting.action;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Random;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.struts2.ServletActionContext;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.edspread.meeting.DTO.DraftMessageDTO;
import com.edspread.meeting.DTO.UserLectureDTO;
import com.edspread.meeting.constants.MeetingConstant;
import com.edspread.meeting.entity.Message;
import com.edspread.meeting.entity.User;
import com.edspread.meeting.entity.UserDetails;
import com.edspread.meeting.entity.UserLectures;
import com.edspread.meeting.json.Meeting;
import com.edspread.meeting.json.Page;
import com.edspread.meeting.service.ChannelService;
import com.edspread.meeting.service.ExMessageService;
import com.edspread.meeting.service.UserLectureService;
import com.edspread.meeting.service.UserService;
import com.edspread.meeting.util.ApplicationUtillty;
import com.edspread.meeting.util.DateUtil;
import com.edspread.meeting.util.MeetingException;
import com.edspread.meeting.util.SessionUtil;
import com.google.gson.Gson;
import com.google.gson.internal.LinkedTreeMap;
import com.opensymphony.xwork2.ActionSupport;

public class HomeAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int pageCount;
	private String imageUrl;
	private String meetingName;
	private int channel_id;
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
	private float participantId;
	private Integer userId;
	private Integer draftMsgId;
	private List<DraftMessageDTO> draftMsgList;
	private String message;
	private Byte toOrFrom;
	private String toOrFromName;
	
	private String toUserName;
	private String toUserPic;
	
	private String fromUserName;
	private String fromUserPic;

	
	private UserService userService;
	private ChannelService channelService;
	private ExMessageService exMessageService;
	private UserLectureService userLectureService;
	private ApplicationUtillty applicationUtillty;
	

	public HomeAction(UserService userService,UserLectureService userLectureService,ApplicationUtillty applicationUtillty, ChannelService channelService, ExMessageService exMessageService) {
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
			String uniqueID=UUID.randomUUID().toString();
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
			userId =  Integer.parseInt(meetingData.get(MeetingConstant.USERID));
			String channelId = meetingData.get(MeetingConstant.CHANNELID);
			String contextMsgSeq = meetingData.get(MeetingConstant.MEETINGCTXSEQ);
			String draftMsgId = meetingData.get(MeetingConstant.DRAFTMSGID);
			String toId = meetingData.get(MeetingConstant.TOID);
			String groupId = meetingData.get(MeetingConstant.GROUPID);
			byte sendStatus = Byte.parseByte(meetingData.get(MeetingConstant.SENDSTATUS));
			/*User user = (User) SessionUtil.getSession().get(
					MeetingConstant.USER_SESSION_VAR);
			*/
			if (meetingName != null) {
				status = writeJSONFile(CONTEXT_PATH, meetingName,
						jb.toString(), userId.toString(),uniqueID,channelId,sendStatus,contextMsgSeq,draftMsgId,toId,groupId);
			} else {
				addActionError("Error Occured while saving");
				return ERROR;
			}
			// Comment because now recording is done by IOS Application
	/*		if (meetingData.get(MeetingConstant.RECFILENAME) != null
					&& meetingData.get(MeetingConstant.RECFILENAME).trim()
							.length() > 0) {
				// Delete all files in recording folder
				String destPath = CONTEXT_PATH + File.separator
						+ MeetingConstant.ENOTEBOOK + File.separator +userId 
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
						.println("--------------copy recording file--------------" + meetingData.get(MeetingConstant.TEMPRECFILENAME));
				String srcPath = CONTEXT_PATH + File.separator
						+ meetingData.get(MeetingConstant.TEMPRECFILENAME);
				
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
				}
				System.out.println("srcFile ::: 1" + srcPath);
				String destPath = CONTEXT_PATH + File.separator
						+ MeetingConstant.ENOTEBOOK + File.separator
						+ user.getEmail() + File.separator + meetingName + File.separator
						+ MeetingConstant.RECORDING + File.separator + meetingName
						+ MeetingConstant.RECORDINGFILEFORMAT;
				
				destPath = CONTEXT_PATH + File.separator 
						+ meetingData.get(MeetingConstant.RECFILENAME);
				System.out.println("destFile ::: " + destPath);
				if (!applicationUtillty.copyFile(srcPath, destPath)) {
					addActionError("Error Occured while saving recording");
					return ERROR;
				}
				
			}*/
			/*String lectureDuration = meetingData.get(MeetingConstant.RECFILEDURATION);
			String slides = meetingData.get(MeetingConstant.PAGELIST);
			System.out.println("Lecture Duration::----------------------->"+lectureDuration);
			if(lectureDuration== null){
				lectureDuration = "00:00"; 
			}if(slides == null){
				slides = "0";
			}
			updateLectureInDB(userId,meetingName,lectureDuration,slides);*/
			
		} catch (Exception e) {
			e.printStackTrace();
			addActionError("Error Occured");
			return ERROR;
		}
		return SUCCESS;
	}
    
	private void updateLectureInDB(Integer userId, String lectureTitle,String lectureDuration,String slides) throws MeetingException {
		userLectureService.updateLectureInDB(userId,lectureTitle,lectureDuration,Integer.parseInt(slides));
	}
	
	public String retrieveDraftMessages() {
		try {
			List<Message> messages = exMessageService.findByUserId(""+userId, MeetingConstant.DRAFT);
			draftMsgList = new ArrayList<>();
			for (Message message : messages) {
				DraftMessageDTO draftMessageDTO =  new DraftMessageDTO();
				draftMessageDTO.setMessageId(message.getId());
				draftMessageDTO.setTitle(message.getTitle());
				draftMessageDTO.setChannelId(message.getxMsgId());
				draftMessageDTO.setCreatedAt(message.getCreatedAt().toString());
				draftMsgList.add(draftMessageDTO);
			}
			
		} catch (MeetingException e) {
			e.printStackTrace();
		}
		return SUCCESS;
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
				/*try {
						if (!FileUtils.deleteQuietly(file2)) {
							addActionError("Error occured while deleting file");
							return ERROR;
						}
					} catch (Exception e) {
						e.printStackTrace();
						addActionError("Error occured while deleting file");
						return ERROR;
	
					}*/
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
				/*try {
					if (!FileUtils.deleteQuietly(file2)) {
						addActionError("Error occured while deleting file");
						return ERROR;
					}
				} catch (Exception e) {
					e.printStackTrace();
					addActionError("Error occured while deleting file");
					return ERROR;
	
				}*/
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
		//meetingName = "test";
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
		/*if (!FileUtils.deleteQuietly(fl)) {
			addActionError("Error occured while deleting file");
			return ERROR;
		}*/
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
			if (jsonObject.get(MeetingConstant.CHANNELID) != null) {
				fileList.put(MeetingConstant.CHANNELID,
						jsonObject.get(MeetingConstant.CHANNELID).toString());
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
			if (jsonObject.get(MeetingConstant.SENDSTATUS) != null) {
				fileList.put(MeetingConstant.SENDSTATUS,
						jsonObject.get(MeetingConstant.SENDSTATUS)
								.toString());
			}
			if (jsonObject.get(MeetingConstant.MEETINGCTXSEQ) != null) {
				fileList.put(MeetingConstant.MEETINGCTXSEQ,
						jsonObject.get(MeetingConstant.MEETINGCTXSEQ)
								.toString());
			}
			if (jsonObject.get(MeetingConstant.USERID) != null) {
				fileList.put(MeetingConstant.USERID,
						jsonObject.get(MeetingConstant.USERID)
								.toString());
			}
			if (jsonObject.get(MeetingConstant.DRAFTMSGID) != null) {
				fileList.put(MeetingConstant.DRAFTMSGID,
						jsonObject.get(MeetingConstant.DRAFTMSGID)
								.toString());
			}
			if (jsonObject.get(MeetingConstant.TOID) != null) {
				fileList.put(MeetingConstant.TOID,
						jsonObject.get(MeetingConstant.TOID)
								.toString());
			}
			if (jsonObject.get(MeetingConstant.GROUPID) != null) {
				fileList.put(MeetingConstant.GROUPID,
						jsonObject.get(MeetingConstant.GROUPID)
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
	 * @param sendStatus 
	 * @param contextMsgSeq 
	 * @param draftMsgId 
	 * @param groupId 
	 * @param toId 
	*/
	public boolean writeJSONFile(String path, String meetingName,
			String content, String name, String uniqueID, String channelId, byte sendStatus, String contextMsgSeq, String draftMsgId, String toId, String groupId) {
		
		float nextSeqNo =  getNextSequenceNumber(channelId,contextMsgSeq);
		
		//float nextSeqNo = exmsgs.size()+1;
		content = parseJsonContent(content,uniqueID, nextSeqNo,sendStatus);
		File file = new File(path + File.separator + MeetingConstant.ENOTEBOOK
				+ File.separator + name + File.separator + meetingName);
		// if dir doesn't exists, then create it
		if (!file.exists()) {
			file.mkdirs();
		}
		System.out.println("Path:::" + file.getAbsolutePath());
		
		
		file = new File(file.getAbsolutePath() + File.separator + meetingName+"_"+uniqueID
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
		saveMessage(name, channelId, nextSeqNo,meetingName, file,sendStatus,draftMsgId,toId,groupId);
		return true;

	}

	private float getNextSequenceNumber(String channelId, String contextMsgSeq) {
		List<Message> exmsgs = new ArrayList<>();
		float seqNumber = -1;
		try {
			exmsgs = exMessageService.findByxMsgId(Integer.parseInt(channelId),MeetingConstant.SEND);
			List<Float> seqnumList = new ArrayList();
			System.out.println("getNextSequenceNumber::exmsgs.size():"+exmsgs.size());
			if(exmsgs.size() == 0){
				seqNumber = (float) 1.0;
			}else{
				for (Message message : exmsgs) {
					seqnumList.add(Float.parseFloat(message.getSequenceNum()));
				}
			}
			System.out.println("getNextSequenceNumber::contextMsgSeq:"+contextMsgSeq+":::"+seqnumList.size());
			if(contextMsgSeq != null && seqnumList.size() > 0){
				int index = seqnumList.indexOf(Float.parseFloat(contextMsgSeq));
				if(index == -1){
					System.out.println("Invalid Context Sequence Number");
				}else{
					if(index == seqnumList.size()-1){
						// tail
						seqNumber = seqnumList.get(index)+1;
						System.out.println("tail::::"+seqNumber);
					}else{
						// insert in middle
						seqNumber =  (seqnumList.get(index) +  seqnumList.get(index+1))/2;
						System.out.println("insertion::::"+seqNumber);
					}
				}
			}else{
				seqNumber = (float) 1.0;
				System.out.println("else case::::"+seqNumber);
			}
		} catch (NumberFormatException e2) {
			e2.printStackTrace();
		} catch (MeetingException e2) {
			e2.printStackTrace();
		}
		return seqNumber;
	}

	private void saveMessage(String name, String channelId, float nextSeqNo,String title, File file, byte sendStatus, String draftMsgId, String toId, String groupId) {
		try {
			Message message = new Message();
			if(draftMsgId != null){
				message.setId(Integer.parseInt(draftMsgId));
			}
			message.setxMsgId(Integer.parseInt(channelId));
			message.setSequenceNum(""+nextSeqNo);
			message.setHttpmessagepath(file.getAbsoluteFile().getAbsolutePath());
			message.setCreated_by(name);
			message.setTitle(title);
			message.setActive((byte) 1);
			if(toId != null && !toId.isEmpty()){
				message.setToId(Integer.parseInt(toId));
			}
			if(groupId != null && !groupId.isEmpty()){
				message.setGroupId(Integer.parseInt(groupId));
			}
			message.setSendOrDraft(sendStatus);
			exMessageService.save(message);
		} catch (MeetingException e1) {
			e1.printStackTrace();
		}
	}
    public String parseJsonContent(String content, String uniqueID, float sequenceNo, byte sendStatus){
    	Gson g = new Gson();
		
			Meeting meeting = g.fromJson(content, Meeting.class);
			List<Object> ltms = null;
			if(meeting.getPageList() != null){
				for(Page page:meeting.getPageList()){
					ltms =  new ArrayList<>();
					System.out.println("seqqq ::"+meeting.getRecSequenceNo());
					meeting.setRecSequenceNo(""+sequenceNo);
					
					for	(Object obj : page.getGraphicsObject()){
						LinkedTreeMap ltm = (LinkedTreeMap)obj;
						/*if(ltm.get("usersObjectIdentifierId").equals("undefined")){
							ltm.put("usersObjectIdentifierId", uniqueID);
							ltm.put("sequenceNo", sequenceNo);
							ltms.add(ltm);
						}*/
						System.out.println(ltm.get("id"));
						ltm.put("id",generateUniqueObjectId((int)sequenceNo));
						
						if(ltm.get("isDraft").equals("1")){
							ltms.add(ltm);
							ltm.put("sequenceNo", sequenceNo);
							if(sendStatus == 0)
								ltm.put("isDraft", 1);
							else if(sendStatus == 1)
								ltm.put("isDraft", 0);
						}
						if(((Double)ltm.get("type")).doubleValue() ==27){
							LinkedTreeMap ltm2 = (LinkedTreeMap)ltm.get("media");
							System.out.println(ltm2.get("fileName"));
							ltm2.put("fileName",System.currentTimeMillis());
						}
						
						page.setGraphicsObject(ltms);
					}
				}
			}
		content = 	g.toJson(meeting);
		System.out.println(content);
    	return content;
    	
    }
	public String retrieveMeetingjson() {
		String CONTEXT_PATH = SessionUtil.getServerDeploymentPath();
		System.out.println("CONTEXT_PATH::" + CONTEXT_PATH);
		/*User user = (User) SessionUtil.getSession().get(
				MeetingConstant.USER_SESSION_VAR);*/
		//System.out.println("channelId : home "+channel_id);
		List<Message> exmsgs = null;
		try {
			exmsgs =exMessageService.findByxMsgId(channel_id,MeetingConstant.SEND);
		} catch (MeetingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		/*File folder = new File(CONTEXT_PATH + File.separator
				+ MeetingConstant.ENOTEBOOK + File.separator
				+ userId + File.separator + meetingName);
		File[] listOfFiles = folder.listFiles();
		if(listOfFiles == null){
			jsonContent = null;
			return SUCCESS;
		}
		System.out.println(listOfFiles.length);*/
		File draftMessage = null;
		StringBuilder jb= new StringBuilder();
		Message msgTobeShown = null;
		if(draftMsgId != null){
			try {
				Message message = exMessageService.findByMsgId(draftMsgId);
				msgTobeShown = message;
				draftMessage = new File(message.getHttpmessagepath());
				String line = null;
				BufferedReader reader = null;
				try {
					reader = new BufferedReader(new FileReader(draftMessage));
					while ((line = reader.readLine()) != null)
						jb.append(line);
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					try {
						reader.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				
			} catch (MeetingException e) {
				e.printStackTrace();
			}
			
			Map<String, String> draftMsgData = getMeetingData(jb.toString());
			String msgContextId = draftMsgData.get(MeetingConstant.MEETINGCTXSEQ);
			if(msgContextId != null){
				participantId = Float.parseFloat(msgContextId);
			}
			
		}
		
		List<File> files = new ArrayList<>();
		File exmFile = null;
		try{
			if(participantId == 0){
				for(Message em : exmsgs){
					exmFile = new File(em.getHttpmessagepath());
					files.add(exmFile);
					System.out.println("**********participantId==0****"+draftMsgId);
					//setToOrFrom(userId, em);
					if(draftMsgId == null)
						msgTobeShown = em;
				}
			}else{
				for(Message em : exmsgs){
					exmFile = new File(em.getHttpmessagepath());
					float seqNum = Float.parseFloat(em.getSequenceNum());
					if(seqNum <= participantId){
						files.add(exmFile);
						//setToOrFrom(userId, em);
						System.out.println("**********else****"+draftMsgId);
						if(draftMsgId == null)
							msgTobeShown = em;
					}
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		File file1 = new File(CONTEXT_PATH + File.separator
				+ MeetingConstant.ENOTEBOOK + File.separator
				+ userId + File.separator + meetingName
				+ File.separator + meetingName + MeetingConstant.JSONFORMAT);
		//System.out.println("MeetingPath:::"+file1.getAbsolutePath());
		
		if(draftMessage != null){
			files.add(draftMessage);
			setToOrFrom(MeetingConstant.TO);
		}
		if(files.size() == 0){
			if (!file1.exists()) {
				addActionError("Meeting Not Found");
				return ERROR;
			} else {
				BufferedReader in = null;
				try {
					in = new BufferedReader(new FileReader(file1));
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
					
					System.out.println("-----JSON Content-Found----");
				} catch (IOException e) {
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
		}
		Map<Integer, Page> pageMap = null;
		Meeting mt=null;
		Meeting lstMeeting = null;
		Gson g = new Gson();
		
		for(File file : files){
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
				//System.out.println("jsonContent:::"+jsonContent);
				
				//  g = new Gson();
				
				if(mt == null){
					mt = g.fromJson(jsonContent, Meeting.class);
					lstMeeting = mt;
					pageMap = createPageMap(mt);
				}else{
					Meeting nextMt = g.fromJson(jsonContent, Meeting.class);
					if(nextMt.getPageList() != null){
						for(Page page:nextMt.getPageList()){
							Page existingPage = pageMap.get(page.getPagenumber().intValue());
							if(existingPage == null){
								pageMap.put(page.getPagenumber().intValue(), page);
							}else{
								existingPage.getGraphicsObject().addAll(page.getGraphicsObject());
							}
							
						}
					}
					lstMeeting = nextMt;
				}
				System.out.println(mt.getMeetingName());
				System.out.println("rec name :: "+mt.getRecFname());
				
				if (setRecordingEnv().equals(ERROR)) {
					addActionError("Error occured while copying recording file.");
					return ERROR;
				}
				
				System.out.println("-----JSON Content-Found----");
			} catch (Exception e) {
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
		}
		
		if(pageMap != null){
			List<Page> pageList = new ArrayList<>();
			Set<Entry<Integer,Page>> eSet = pageMap.entrySet();
			for (Iterator<Entry<Integer, Page>> iterator = eSet.iterator(); iterator.hasNext();) {
				Entry<Integer, Page> entry = (Entry<Integer, Page>) iterator.next();
				pageList.add(entry.getValue());
			}
			mt.setPageList(pageList);
		}
		
		mt.setRecFileDuration(lstMeeting.getRecFileDuration());
		mt.setRecFname(lstMeeting.getRecFname());
		mt.setTempRecFile(lstMeeting.getTempRecFile());
		mt.setRecSequenceNo(lstMeeting.getRecSequenceNo());
		mt.setSend(lstMeeting.getSend());
		mt.setMeetingContextSequence(lstMeeting.getMeetingContextSequence());
		//mt.setSessionId(lstMeeting.getSessionId());
		//mt.setSequenceNo(participantId);
		//mt.setRecSequenceNo(participantId);
		System.out.println("last Message Recording file path::"+mt.getRecFname());
		jsonContent = g.toJson(mt);
		isAppend = true;
		//setToOrFrom();
		System.out.println("*************jsonContent******"+jsonContent);
		System.out.println("**********Finally msgTobeShown****"+msgTobeShown);
		setSenderReceiverDetails(msgTobeShown,userId);
		return SUCCESS;
	}
	
	private void setSenderReceiverDetails(Message msgTobeShown,Integer userId) {
		try {
			Integer toId = msgTobeShown.getToId();
			Integer fromId = Integer.parseInt(msgTobeShown.getCreated_by());
			User fromUser = userService.findById(fromId);
			UserDetails fromUserDetails = userService.findByUserId(fromId);
			if(fromId.intValue() ==  userId.intValue()){
				setFromUserName("Me");
			}else{
				setFromUserName(fromUser.getName());
			}
			System.out.println("*********fromUserDetails****"+fromUserDetails);
			if(fromUserDetails != null){
				setFromUserPic(fromUserDetails.getProfilePix());
			}
			User toUser = userService.findById(toId);
			UserDetails toUserDetails = userService.findByUserId(toId);
			System.out.println("*********toUserDetails****"+toUserDetails);
			if(toUserDetails!= null){
				setToUserPic(toUserDetails.getProfilePix());
			}
			if(toId.intValue() ==  userId.intValue()){
				setToUserName("Me");
			}else{
				setToUserName(toUser.getName());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	private void setToOrFrom() {
		StringBuilder toFrom = new StringBuilder();
		try {
			User user = userService.findById(Integer.parseInt(getToOrFromName()));
			if(getToOrFrom().byteValue() == MeetingConstant.TO){
				toFrom.append("To:");
			}else{
				toFrom.append("From:");
			}
			toFrom.append(user.getEmail());
		} catch (NumberFormatException | MeetingException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		setToOrFromName(toFrom.toString());
	}

	private void setToOrFrom(Integer userId,Message message){
		if(Integer.parseInt(message.getCreated_by()) == userId.intValue()){
			 setToOrFrom(MeetingConstant.TO);
			 setToOrFromName(""+message.getToId());
		}else{
			setToOrFrom(MeetingConstant.FROM);
			setToOrFromName(""+message.getCreated_by());
		}
		
	}
	
	private Map<Integer, Page> createPageMap(Meeting mt) {
		Map<Integer, Page> pageMap = new HashMap<>();
		if(mt.getPageList() != null){
			for(Page page:mt.getPageList()){
				pageMap.put(page.getPagenumber().intValue(), page);
			}
		}
		return pageMap;
	}

	public String saveMessageStatusToSend() {
		message= ERROR;
		try {
			Message msg = exMessageService.findByMsgId(draftMsgId);
			if(msg != null){
				updateSendStatusInJSON(msg.getHttpmessagepath());
				msg.setSendOrDraft(MeetingConstant.SEND);
				exMessageService.save(msg);
				message = MeetingConstant.XMSG_SERVERHTTPPATH+"?title="+msg.getTitle()+"&userId="+msg.getCreated_by()+"&xmsgId="+msg.getxMsgId()+"&sequenceNum="+msg.getSequenceNum();
			}else{
				message ="Message not found";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	private void updateSendStatusInJSON(String jsonPath) {
		BufferedReader in = null;
		Meeting mt=null;
		Gson g = new Gson();
		try {
			in = new BufferedReader(new FileReader(jsonPath));
			String line;
			StringBuilder recievedJson = new StringBuilder();
			while ((line = in.readLine()) != null) {
				recievedJson.append(line);
			}
			jsonContent = recievedJson.toString();
			mt = g.fromJson(jsonContent, Meeting.class);
			mt.setSend("1");
			jsonContent = g.toJson(mt);
			
			FileWriter fw;
			try {
				fw = new FileWriter(jsonPath);
				BufferedWriter bw = new BufferedWriter(fw);
				bw.write(jsonContent);
				bw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	//PartCipants Code
/*	public String retrieveParticipantsjson() {
		String CONTEXT_PATH = SessionUtil.getServerDeploymentPath();
		System.out.println("participantId : "+participantId);
		System.out.println("CONTEXT_PATH::" + CONTEXT_PATH);
		User user = (User) SessionUtil.getSession().get(
				MeetingConstant.USER_SESSION_VAR);
		//System.out.println("channelId : home "+channel_id);
		
		
		HttpServletRequest request = ServletActionContext.getRequest();
		StringBuffer jb1 = new StringBuffer();
		String line1 = null;
		try {
			BufferedReader reader = request.getReader();
			while ((line1 = reader.readLine()) != null)
				jb1.append(line1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("jb : "+jb1);
		
		
		List<ExMessage> exmsgs = null;
		try {
			exmsgs =exMessageService.findByChannelId(channel_id);
		} catch (MeetingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		File folder = new File(CONTEXT_PATH + File.separator
				+ MeetingConstant.ENOTEBOOK + File.separator
				+ user.getEmail() + File.separator + meetingName);
		File[] listOfFiles = folder.listFiles();
		System.out.println(listOfFiles.length);
		List<File> files = new ArrayList<>();
		File exmFile = null;
		try{
		for(ExMessage em : exmsgs){
			exmFile = new File(em.getHttpmessagepath());
			files.add(exmFile);
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		File file1 = new File(CONTEXT_PATH + File.separator
				+ MeetingConstant.ENOTEBOOK + File.separator
				+ user.getEmail() + File.separator + meetingName
				+ File.separator + meetingName + MeetingConstant.JSONFORMAT);
		System.out.println("MeetingPath:::"+file1.getAbsolutePath());
		
		
		
		
		Meeting mt=null;
		for(File file : files){
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
				System.out.println("jsonContent:::"+jsonContent);
				
				Gson g = new Gson();
				if(mt == null){
					mt = g.fromJson(jsonContent, Meeting.class);
				}else{
					Meeting nextMt = g.fromJson(jsonContent, Meeting.class);
					
					for(Page page:nextMt.getPageList()){
						for(Page ppage:mt.getPageList()){
							if(page.getPagenumber() == ppage.getPagenumber()){
								ppage.getGraphicsObject().addAll(page.getGraphicsObject());
							}
						}
					}
					
				}
				System.out.println(mt.getMeetingName());
				System.out.println(mt.getPageList());
				System.out.println("rec name :: "+mt.getRecFname());
						
				jsonContent = g.toJson(mt);
				System.out.println("jsonContent11:::"+jsonContent);
				isAppend = true;
				if (setRecordingEnv().equals(ERROR)) {
					addActionError("Error occured while copying recording file.");
					return ERROR;
				}
				
				 * HttpServletResponse response =
				 * ServletActionContext.getResponse();
				 * response.setContentType("application/json");
				 * response.getWriter().write(jsonContent );
				 
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

		}}
		return SUCCESS;
	}
	*/
	
	private int generateUniqueObjectId(int seq){
		Random rand = new Random(); 
		int value = rand.nextInt(seq*10000); 
		return value;
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

	public int getChannel_id() {
		return channel_id;
	}

	public void setChannel_id(int channel_id) {
		this.channel_id = channel_id;
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

	
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public float getParticipantId() {
		return participantId;
	}

	public void setParticipantId(float participantId) {
		this.participantId = participantId;
	}

	public Integer getDraftMsgId() {
		return draftMsgId;
	}

	public void setDraftMsgId(Integer draftMsgId) {
		this.draftMsgId = draftMsgId;
	}

	public List<DraftMessageDTO> getDraftMsgList() {
		return draftMsgList;
	}

	public void setDraftMsgList(List<DraftMessageDTO> draftMsgList) {
		this.draftMsgList = draftMsgList;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Byte getToOrFrom() {
		return toOrFrom;
	}

	public void setToOrFrom(Byte toOrFrom) {
		this.toOrFrom = toOrFrom;
	}

	public String getToOrFromName() {
		return toOrFromName;
	}

	public void setToOrFromName(String toOrFromName) {
		this.toOrFromName = toOrFromName;
	}

	public String getToUserName() {
		return toUserName;
	}

	public void setToUserName(String toUserName) {
		this.toUserName = toUserName;
	}

	public String getToUserPic() {
		return toUserPic;
	}

	public void setToUserPic(String toUserPic) {
		this.toUserPic = toUserPic;
	}

	public String getFromUserName() {
		return fromUserName;
	}

	public void setFromUserName(String fromUserName) {
		this.fromUserName = fromUserName;
	}

	public String getFromUserPic() {
		return fromUserPic;
	}

	public void setFromUserPic(String fromUserPic) {
		this.fromUserPic = fromUserPic;
	}

}
