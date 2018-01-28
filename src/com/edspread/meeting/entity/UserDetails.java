package com.edspread.meeting.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;



@NamedQueries({
	@NamedQuery(name = "UserDetails.findByUserId", query = "Select u from UserDetails u where u.userId = :userId and u.active = 1"),
		})
/**
 * The persistent class for the user database table.
 * 
 */
@Entity
@Table(name = "userdetails")
public class UserDetails extends Domain<Integer> implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Integer id;

	@Column(name = "userid")
	private Integer userId;
	
	
	@Column(name = "fname")
	private String firstName;

	@Column(name = "lname")
	private String lastName;

	
	@Column(name = "mobile")
	private String mobile;

	@Column(name = "profilepix")
	private String profilePix;
	
	@Column(name = "active")
	private byte active;
	
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getProfilePix() {
		return profilePix;
	}

	public void setProfilePix(String profilePix) {
		this.profilePix = profilePix;
	}

	public byte getActive() {
		return active;
	}

	public void setActive(byte active) {
		this.active = active;
	}

}
