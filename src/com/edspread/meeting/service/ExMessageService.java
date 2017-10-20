package com.edspread.meeting.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.edspread.meeting.dao.ExMessageDao;
import com.edspread.meeting.entity.Channel;
import com.edspread.meeting.entity.ExMessage;
import com.edspread.meeting.entity.User;
import com.edspread.meeting.util.MeetingException;

public class ExMessageService {
	private ExMessageDao exMessageDao;
	
	public void saveChannelExMessage(int channel_id,int sequenceNo, String httpmessagepath, String localmessagepath, String created_by) throws MeetingException {
		exMessageDao.saveChannelsExMessage(channel_id, sequenceNo,  httpmessagepath,  localmessagepath,  created_by);
		
		return;
	}
	
	public List<ExMessage> findByChannelId(int channelId) throws MeetingException {
		return exMessageDao.findByChannelId(channelId);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public void save(ExMessage user) throws MeetingException {
		try {
			if (user.getId() == null) {
				exMessageDao.persist(user);
			} else {
				exMessageDao.merge(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	public List<ExMessage> getParticipants(int channelId,String email) throws MeetingException {
		return exMessageDao.findByChannelId(channelId);
		

	}

	public ExMessageDao getExMessageDao() {
		return exMessageDao;
	}

	public void setExMessageDao(ExMessageDao exMessageDao) {
		this.exMessageDao = exMessageDao;
	}

}
