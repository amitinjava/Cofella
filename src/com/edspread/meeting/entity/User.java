package com.edspread.meeting.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;



@NamedQueries({
		@NamedQuery(name = "User.findByEmailAndPwd", query = "Select u from User u where u.email = :email and u.activeStatus = 1 and u.password=:password and u.type =:userType"),
		//@NamedQuery(name = "User.findByName", query = "Select u from User u where u.name = :name and u.activeStatus = 1 and u.type =:userType"),
		@NamedQuery(name = "User.findByEmail", query = "Select u from User u where u.email = :email and u.activeStatus = 1 and u.type =:userType"),
		/*	@NamedQuery(name = "User.findByEmailandFacebookId", query = "Select u from User u ,FacebookUserDetail fb where u.id=fb.user.id and u.accessToken is not null and fb.email = :email and u.status = 1 and fb.facebookId=:facebookId"),
		@NamedQuery(name = "User.countByEmail", query = "Select count(u.id) from User u where u.email = :email"),
		@NamedQuery(name = "User.countByMobile", query = "Select count(u.id) from User u where u.mobile = :mobile"),
		@NamedQuery(name = "User.findByEmail", query = "Select u from User u where u.email = :email and u.status = 1"),
		@NamedQuery(name = "User.findAdminUsers", query = "Select u from User u where (u.userType = 1 or u.userType = 4) and u.status = 1 order by u.name"),
		@NamedQuery(name = "User.findByUserId", query = "Select u from User u where u.id = :userId and u.status = 1"),
		// @NamedQuery(name = "User.findByMacro", query =
		// "Select u from User u, IN (u.macroUsers) mu, IN (mu.macro) mac where mac.id = :macroId and u.status = 1 and u.userType in (1,3,4) order by u.userType"),
		@NamedQuery(name = "User.findByMacro", query = "Select u from User u, IN (u.macroUsers) mu, IN (mu.macro) mac where mac.id = :macroId and u.status = 1 order by u.userType,u.name"),
		@NamedQuery(name = "User.findNewByEmail", query = "Select u from User u where u.email = :userEmail and u.status = 1 and u not in (Select usr from User usr, IN (usr.macroUsers) mu, IN (mu.macro) mac where mac.id = :macroId) "),
		@NamedQuery(name = "User.findSalesUsers", query = "Select u from User u where (u.userType = 1) and u.status = 1 order by u.name"),
		@NamedQuery(name = "User.findOpsUsers", query = "Select u from User u where u.userType = :userType and u.status = 1 order by u.createdAt")*/ })
/**
 * The persistent class for the user database table.
 * 
 */
@Entity
@Table(name = "user")
public class User extends Domain<Integer> implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "first_name")
	private String firstName;
	
	@Column(name = "last_name")
	private String lastName;

	@Column(name = "password")
	private String password;

	@Column(name = "email")
	private String email;

	@Column(name = "type")
	private byte type;

	@Column(name = "active_status")
	private byte activeStatus;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_at")
	private Date createdAt;

	@Column(name = "updated_at")
	private Timestamp updatedAt;
	
	@OneToMany(mappedBy="user", fetch=FetchType.LAZY)
  	@OrderBy("id desc")
	private Set<UserLectures> userLectures;

	

	

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public byte getType() {
		return type;
	}

	public void setType(byte type) {
		this.type = type;
	}

	public byte getActiveStatus() {
		return activeStatus;
	}

	public void setActiveStatus(byte activeStatus) {
		this.activeStatus = activeStatus;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Timestamp getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Timestamp updatedAt) {
		this.updatedAt = updatedAt;
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

	

	@Override
	public Integer getId() {
		return id;
	}

	@Override
	public void setId(Integer id) {
		this.id = id;
		
	}

	public Set<UserLectures> getUserLectures() {
		return userLectures;
	}

	public void setUserLectures(Set<UserLectures> userLectures) {
		this.userLectures = userLectures;
	}
}
