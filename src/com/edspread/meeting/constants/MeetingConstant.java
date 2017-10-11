package com.edspread.meeting.constants;

public class MeetingConstant {
	public static final String ENOTEBOOK = "Enotebook";
	public static final String TEMP = "temp";
	public static final String RECORDING = "recording";
	public static final String MEETING= "MeetingName";
	public static final String CHANNELID= "channelId";
	public static final String TEMPRECORDING = "recordings";
	public static final String MEETINGNAME = "mname";
	public static final String RECFILENAME = "RecFname";
	public static final String RECFILEDURATION = "RecFileDuration";
	public static final String PAGELIST = "PageList";
	public static final String TEMPRECFILENAME = "TempRecFile";
	public static final String JSONFORMAT = ".json";
	public static final String RECORDINGFILEFORMAT = ".mp3";
	public static final String UPLOADDIR = "mettingupload";
	
	public static final String NEWLECTUREACTION = "newlec";
	public static final String RENAMELECACTION = "renamelec";
	public static final String DUPLICATELECACTION = "duplec";
	public static final String DELETELECACTION = "dellec";
	
	
	
	//public static final String SERVRDOWNLOADPATH = "http://117.218.36.182/mettingupload/";
	//public static final String SERVRDOWNLOADPATH = "http://ec2-54-87-226-240.compute-1.amazonaws.com/mettingupload/";
	public static final String SERVRDOWNLOADPATH = "http://ec2-54-148-26-34.us-west-2.compute.amazonaws.com/mettingupload/";
	
	public static final String USER_SESSION_VAR ="user";
	public static final String USER_TIMEZONE_OFFSET ="timezoneoffset";
	public static final String FORGOT_PWD_LINK ="http://ttmachine.no-ip.org<%=request.getContextPath()%>/resetpassword";
	
	public static final String LOGIN ="login";
	public static final String TRUE ="true";
	public static final String PLAY ="play";
	
	public static final Integer ROOT_ID = 1;
	public static byte ADMIN_USERTYPE = 1;
	public static byte USER_USERTYPE = 2;
	public static byte ACTIVE_STATUS = 1;
	public static byte INACTIVE_STATUS = 0;
	public static final String DATE_FORMAT = "dd-MM-yyyy";
	public static final String LECTUREDATE_FORMAT = "EEE, d MMM yyyy HH:mm:ss";

}
