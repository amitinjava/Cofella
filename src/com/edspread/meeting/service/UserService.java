package com.edspread.meeting.service;

import java.util.List;
import java.util.Set;

import org.springframework.transaction.annotation.Transactional;

import com.edspread.meeting.constants.MeetingConstant;
import com.edspread.meeting.dao.UserDao;
import com.edspread.meeting.entity.User;
import com.edspread.meeting.entity.UserLectures;
import com.edspread.meeting.util.MeetingException;
import com.edspread.meeting.util.SessionUtil;



public class UserService {

	private UserDao userDao;
	
	

	@Transactional(rollbackFor = Exception.class)
	public User findById(Integer userId) throws MeetingException {
		return userDao.findById(userId,User.class);
	}
	@Transactional(rollbackFor = Exception.class)
	public List<User> findByName(String userName,byte userType) throws MeetingException {
		return userDao.findByName(userName,userType);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public List<User> findByEmail(String email,byte userType) throws MeetingException {
		return userDao.findByEmail(email,userType);
	}
	@Transactional(rollbackFor = Exception.class)
	public User validateUser(String username,String password,byte userType) throws MeetingException {
		return userDao.validateUser(username,password,userType);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public List<User> findByPhoneNums(Set<String> phoneNums) throws MeetingException {
		return userDao.findByPhoneNums(phoneNums);
	}
	
	
	@Transactional(rollbackFor = Exception.class)
	public void save(User user) throws MeetingException {
		try {
			if (user.getId() == null) {
				userDao.persist(user);
			} else {
				userDao.merge(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	@Transactional(rollbackFor = Exception.class)
	public boolean updatePassword(String email,String password){
		List<User> userList;
		try {
			userList = userDao.findByEmail(email,
					MeetingConstant.USER_USERTYPE);
		
		if (userList == null || userList.size() == 0) {
			return false;
			
		}
		User user =  userList.get(0);
		user.setPassword(password);
		userDao.persist(user);
		return true;
		} catch (MeetingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	@Transactional(rollbackFor = Exception.class)
	public boolean updateUserProfile(User user1) {
		List<User> userList;
		try {
			userList = userDao.findByEmail(user1.getEmail(),
					MeetingConstant.USER_USERTYPE);
		
		if (userList == null || userList.size() == 0) {
			return false;
			
		}
		User user =  userList.get(0);
		user.setFirstName(user1.getFirstName());
		user.setLastName(user1.getLastName());

		user.setEmail(user1.getEmail());
		user.setPassword(user1.getPassword());
		userDao.persist(user);
		return true;
		} catch (MeetingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	
	
	}
	
	
	
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	


}
