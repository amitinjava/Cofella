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
	@NamedQuery(name = "exmessage.findByChannelid", query = "Select u from ExMessage u where u.channel_id =:channel_id"),
})

@Entity
@Table(name = "exmessage")
public class ExMessage  extends Domain<Integer> implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "channel_id")
	private Integer channel_id;
	
	@Column(name = "sequenceNo")
	private Integer sequenceNo;
	
	@Column(name = "httpmessagepath")
	private String httpmessagepath;
	
	@Column(name = "localmessagepath")
	private String localmessagepath;
	
	@Column(name = "created_by")
	private String created_by;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_at")
	private Date createdAt;
	
	/*@Column(name = "active")
	private byte active;*/

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getChannel_id() {
		return channel_id;
	}

	public void setChannel_id(Integer channel_id) {
		this.channel_id = channel_id;
	}

	public Integer getSequenceNo() {
		return sequenceNo;
	}

	public void setSequenceNo(Integer sequenceNo) {
		this.sequenceNo = sequenceNo;
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

	/*public byte getActive() {
		return active;
	}

	public void setActive(byte active) {
		this.active = active;
	}*/

}
