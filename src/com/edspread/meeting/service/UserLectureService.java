package com.edspread.meeting.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.edspread.meeting.dao.UserLectureDao;
import com.edspread.meeting.entity.User;
import com.edspread.meeting.entity.UserLectures;
import com.edspread.meeting.util.DateUtil;
import com.edspread.meeting.util.MeetingException;

public class UserLectureService {
	
	private UserLectureDao userLectureDao;
	
	
	@Transactional(rollbackFor = Exception.class)
	public UserLectures findById(Integer lectureId) throws MeetingException {
		return userLectureDao.findById(lectureId,UserLectures.class);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public void save(UserLectures userLectures) throws MeetingException {
		try {
			if (userLectures.getId() == null) {
				userLectureDao.persist(userLectures);
			} else {
				userLectureDao.merge(userLectures);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	@Transactional(rollbackFor = Exception.class)
	public UserLectures findByUserAndTitle(String title,int userId) throws MeetingException {
		List<UserLectures> UserLecturesList = userLectureDao.findByUserAndTitle(title, userId);
		if(UserLecturesList!= null && UserLecturesList.size()>0){
			return UserLecturesList.get(0);
		}
		return null;
		
	}
	
	public List<UserLectures> findByUser(int userId) throws MeetingException {
		try {
			return userLectureDao.findByUser(userId);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new MeetingException(e.getMessage());
		}
	}
	@Transactional(rollbackFor = Exception.class)
	public void updateLectureInDB(User user, String lectureTitle,String lectureDuration,int slides) throws MeetingException {
		List<UserLectures> UserLecturesList = userLectureDao.findByUserAndTitle(lectureTitle, user.getId());
		if(UserLecturesList!= null && UserLecturesList.size()>0){
			UserLectures userLectures = UserLecturesList.get(0);
			userLectures.setLectureDuration(lectureDuration);;
			userLectures.setSlides(slides);;
			userLectures.setUpdatedAt(DateUtil.getCurrentDateTime());
			userLectureDao.merge(userLectures);
		}
	 }
	@Transactional(rollbackFor = Exception.class)
	public void renameLectureInDB(User user, String lectureTitle,String newlectureTitle) throws MeetingException {
		List<UserLectures> UserLecturesList = userLectureDao.findByUserAndTitle(lectureTitle, user.getId());
		if(UserLecturesList!= null && UserLecturesList.size()>0){
			UserLectures userLectures = UserLecturesList.get(0);
			userLectures.setLectureTitle(newlectureTitle);
			userLectures.setUpdatedAt(DateUtil.getCurrentDateTime());
			userLectureDao.merge(userLectures);
		}
	 }
	
	public List<UserLectures> findByTitleAndUser(String title,int useId) throws MeetingException {
		return userLectureDao.findByTitleAndUser(title,useId);
	}
	
	public void setUserLectureDao(UserLectureDao userLectureDao) {
		this.userLectureDao = userLectureDao;
	}

}
