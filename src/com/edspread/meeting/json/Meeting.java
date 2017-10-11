package com.edspread.meeting.json;

import java.util.List;

public class Meeting {
	private String MeetingName;
	private String channelId;
	private String sessionId;
	private List<Page> PageList;
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
	

}
