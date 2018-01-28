package com.edspread.meeting.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.edspread.meeting.entity.User;
import com.edspread.meeting.util.MeetingException;


public class UserDao extends GenericDao<Integer, User> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public User findByUserId(Integer userId) throws MeetingException {
		List<User> list = findByNamedQuery("User.findByUserId", "userId",
				userId);
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public User validateUser(String email,String pwd,byte userType) throws MeetingException {
		try {
			Map<String, Object> params = new HashMap<String, Object>(3);
			params.put("email", email);
			params.put("password", pwd);
			params.put("userType", userType);
			List<User> list = findByNamedQuery("User.findByEmailAndPwd", params);
			if(list!= null && list.size()>0){
				return list.get(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new MeetingException(e.getMessage());
		}
		return null;
		
	}
	public List<User> findByName(String userName,byte userType) throws MeetingException {
		try {
			Map<String, Object> params = new HashMap<String, Object>(2);
			params.put("name", userName);
			params.put("userType", userType);
			List<User> list = findByNamedQuery("User.findByName", params);
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new MeetingException(e.getMessage());
		}
	
		
	}
	
	public List<User> findByEmail(String email,byte userType) throws MeetingException {
		try {
			Map<String, Object> params = new HashMap<String, Object>(2);
			params.put("email", email);
			params.put("userType", userType);
			List<User> list = findByNamedQuery("User.findByEmail", params);
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new MeetingException(e.getMessage());
		}
	}
	public List<User> findByPhoneNums(Set<String> phoneNos) throws MeetingException {
		List<User> list = findByNamedQuery("User.findByPhoneNums", "phones", phoneNos);
		return list;
	}
	
	
	
	
	
	
	

}