package com.edspread.meeting.DTO;



import java.io.Serializable;

public class MessageHistoryDTO implements Serializable	{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String sender;
	private String receiver;
	private String title;
	private String seqNumber;
	private String time;
	private String senderPic;
	private String receiverPic;
	
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSeqNumber() {
		return seqNumber;
	}
	public void setSeqNumber(String seqNumber) {
		this.seqNumber = seqNumber;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getSenderPic() {
		return senderPic;
	}
	public void setSenderPic(String senderPic) {
		this.senderPic = senderPic;
	}
	public String getReceiverPic() {
		return receiverPic;
	}
	public void setReceiverPic(String receiverPic) {
		this.receiverPic = receiverPic;
	}
	
	
}
