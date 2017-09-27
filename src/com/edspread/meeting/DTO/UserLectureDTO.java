package com.edspread.meeting.DTO;

import java.io.Serializable;

public class UserLectureDTO  implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	
	private String lectureTitle;
	
	private String lectureDuration;

	private Integer slides;


	private String updatedAt;

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

	public Integer getSlides() {
		return slides;
	}

	public void setSlides(Integer slides) {
		this.slides = slides;
	}

	public String getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(String updatedAt) {
		this.updatedAt = updatedAt;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	

}
