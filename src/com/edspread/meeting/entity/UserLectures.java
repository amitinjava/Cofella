package com.edspread.meeting.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@NamedQueries({
	@NamedQuery(name = "UserLectures.findByUserAndTitle", query = "Select ul from UserLectures ul where ul.lectureTitle = :lectureTitle and ul.activeStatus = 1 and ul.user.id=:userId"),
	@NamedQuery(name = "UserLectures.findByTitleAndUser", query = "Select ul from UserLectures ul where ul.lectureTitle like :lectureTitle and ul.activeStatus = 1 and ul.user.id=:userId"),
	@NamedQuery(name = "UserLectures.findByUser", query = "Select ul from UserLectures ul where ul.activeStatus = 1 and ul.user.id=:userId"),
})
/**
 * The persistent class for the user_lectures database table.
 * 
 */
@Entity
@Table(name = "user_lectures")
public class UserLectures extends Domain<Integer> implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "title")
	private String lectureTitle;
	
	@Column(name = "duration")
	private String lectureDuration;

	@Column(name = "slides")
	private Integer slides;

	
	@Column(name = "active_status")
	private byte activeStatus;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;


	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_at")
	private Date createdAt;

	@Column(name = "updated_at")
	private Date updatedAt;

	@Override
	public Integer getId() {
		return id;
	}

	@Override
	public void setId(Integer id) {
		this.id  = id;
	}

	public String getLectureTitle() {
		return lectureTitle;
	}

	public void setLectureTitle(String lectureTitle) {
		this.lectureTitle = lectureTitle;
	}

	public String getLectureDuration() {
		return lectureDuration;
	}

	public void setLectureDuration(String lectureDuration) {
		this.lectureDuration = lectureDuration;
	}

	

	public byte getActiveStatus() {
		return activeStatus;
	}

	public void setActiveStatus(byte activeStatus) {
		this.activeStatus = activeStatus;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}



	public Integer getSlides() {
		return slides;
	}

	public void setSlides(Integer slides) {
		this.slides = slides;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}


}
