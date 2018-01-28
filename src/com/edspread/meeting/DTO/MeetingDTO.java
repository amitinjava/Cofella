package com.edspread.meeting.DTO;



import java.util.List;

public class MeetingDTO {

	private String MeetingName;
	private String TempRecFile;
	private String RecFname;
	private String RecFileDuration;
	private List<Page> PageList;


	
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


}
