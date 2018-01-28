package com.edspread.meeting.json;

import java.util.List;

public class Meeting {
	private String MeetingName;
	private String channelId;
	private String sessionId;
	private Integer sequenceNo;
	private String recSequenceNo;
	private String TempRecFile;
	private String RecFname;
	private String RecFileDuration;
	private String meetingContextSequence;
	private List<Page> PageList;
	private String msgId;
	private String send;
	
	public String getMeetingName() {
		return MeetingName;
	}
	public void setMeetingName(String meetingName) {
		MeetingName = meetingName;
	}
	public List<Page> getPageList() {
		return PageList;
	}
	public void setPageList(List<Page> pageList) {
		PageList = pageList;
	}
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public String getChannelId() {
		return channelId;
	}
	public void setChannelId(String channelId) {
		this.channelId = channelId;
	}
	public String getTempRecFile() {
		return TempRecFile;
	}
	public void setTempRecFile(String tempRecFile) {
		TempRecFile = tempRecFile;
	}
	public String getRecFname() {
		return RecFname;
	}
	public void setRecFname(String recFname) {
		RecFname = recFname;
	}
	public String getRecFileDuration() {
		return RecFileDuration;
	}
	public void setRecFileDuration(String recFileDuration) {
		RecFileDuration = recFileDuration;
	}
	public Integer getSequenceNo() {
		return sequenceNo;
	}
	public void setSequenceNo(Integer sequenceNo) {
		this.sequenceNo = sequenceNo;
	}
	
	public String getMsgId() {
		return msgId;
	}
	public void setMsgId(String msgId) {
		this.msgId = msgId;
	}
	public String getSend() {
		return send;
	}
	public void setSend(String send) {
		this.send = send;
	}
	public String getMeetingContextSequence() {
		return meetingContextSequence;
	}
	public void setMeetingContextSequence(String meetingContextSequence) {
		this.meetingContextSequence = meetingContextSequence;
	}
	public String getRecSequenceNo() {
		return recSequenceNo;
	}
	public void setRecSequenceNo(String recSequenceNo) {
		this.recSequenceNo = recSequenceNo;
	}
	
	

}
