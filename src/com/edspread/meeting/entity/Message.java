package com.edspread.meeting.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@NamedQueries({
	//@NamedQuery(name = "exmessage.save", query = "INSERT INTO exmessage(  channel_id  ,sequenceNo  ,httpmessagepath  ,localmessagepath  ,created_by   ,active) VALUES (  :channel_id   ,:sequenceNo   ,:httpmessagepath  ,:localmessagepath  ,:created_by    ,1 )")
	@NamedQuery(name = "message.findByxMsgId", query = "Select msg from Message msg where msg.xMsgId =:xMsgId and msg.sendOrDraft=:sendOrDraft order by msg.createdAt"),
	@NamedQuery(name = "message.findByUserId", query = "Select msg from Message msg where msg.created_by =:created_by and msg.sendOrDraft=:sendOrDraft"),
	@NamedQuery(name = "message.findMsgByxMsgIdUserId", query = "Select msg from Message msg where msg.xMsgId =:xMsgId and msg.created_by =:created_by and msg.sendOrDraft=:sendOrDraft"),
})

@Entity
@Table(name = "message")
public class Message  extends Domain<Integer> implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "xmsg_id")
	private Integer xMsgId;
	
	@Column(name = "sequence_num")
	private String sequenceNum;
	
	@Column(name = "title")
	private String title;
	
	
	@Column(name = "httpmessagepath")
	private String httpmessagepath;
	
	@Column(name = "localmessagepath")
	private String localmessagepath;
	
	@Column(name = "created_by")
	private String created_by;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_at")
	private Date createdAt;
	
	@Column(name = "send_draft")
	private byte sendOrDraft;

	@Column(name = "active")
	private byte active;
	
	@Column(name = "to_id")
	private Integer toId;
	
	@Column(name = "group_id")
	private Integer groupId;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	

	public Integer getxMsgId() {
		return xMsgId;
	}

	public void setxMsgId(Integer xMsgId) {
		this.xMsgId = xMsgId;
	}



	public String getHttpmessagepath() {
		return httpmessagepath;
	}

	public void setHttpmessagepath(String httpmessagepath) {
		this.httpmessagepath = httpmessagepath;
	}

	public String getLocalmessagepath() {
		return localmessagepath;
	}

	public void setLocalmessagepath(String localmessagepath) {
		this.localmessagepath = localmessagepath;
	}

	public String getCreated_by() {
		return created_by;
	}

	public void setCreated_by(String created_by) {
		this.created_by = created_by;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public byte getActive() {
		return active;
	}

	public void setActive(byte active) {
		this.active = active;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSequenceNum() {
		return sequenceNum;
	}

	public void setSequenceNum(String sequenceNum) {
		this.sequenceNum = sequenceNum;
	}

	public byte getSendOrDraft() {
		return sendOrDraft;
	}

	public void setSendOrDraft(byte sendOrDraft) {
		this.sendOrDraft = sendOrDraft;
	}

	public Integer getToId() {
		return toId;
	}

	public void setToId(Integer toId) {
		this.toId = toId;
	}

	public Integer getGroupId() {
		return groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}

	

}
