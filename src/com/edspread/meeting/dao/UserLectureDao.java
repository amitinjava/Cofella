package com.edspread.meeting.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.edspread.meeting.entity.UserLectures;
import com.edspread.meeting.util.MeetingException;

public class UserLectureDao  extends GenericDao<Integer, UserLectures> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public List<UserLectures> findByUserAndTitle(String title,int userId) throws MeetingException {
		try {
			Map<String, Object> params = new HashMap<String, Object>(2);
			params.put("lectureTitle", title);
			params.put("userId", userId);
			List<UserLectures> list = findByNamedQuery("UserLectures.findByUserAndTitle", params);
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new MeetingException(e.getMessage());
		}
	}
	
	public List<UserLectures> findByUser(int userId) throws MeetingException {
		try {
			Map<String, Object> params = new HashMap<String, Object>(1);
			params.put("userId", userId);
			List<UserLectures> list = findByNamedQuery("UserLectures.findByUser", params);
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new MeetingException(e.getMessage());
		}
	}
	
	
	public List<UserLectures> findByTitleAndUser(String title,int userId) throws MeetingException {
		try {
			Map<String, Object> params = new HashMap<String, Object>(1);
			params.put("lectureTitle", "%"+title+"%");
			params.put("userId", userId);
			List<UserLectures> list = findByNamedQuery("UserLectures.findByTitleAndUser", params);
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new MeetingException(e.getMessage());
		}
	}
	
	

}
