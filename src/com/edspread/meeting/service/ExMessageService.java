package com.edspread.meeting.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.edspread.meeting.dao.ExMessageDao;
import com.edspread.meeting.entity.Message;
import com.edspread.meeting.util.MeetingException;

public class ExMessageService {
	
	private ExMessageDao exMessageDao;
	
	public void saveChannelExMessage(int channel_id,int sequenceNo, String httpmessagepath, String localmessagepath, String created_by) throws MeetingException {
		
		exMessageDao.saveChannelsExMessage(channel_id, sequenceNo,  httpmessagepath,  localmessagepath,  created_by);
		
		return;
	}
	
	/*public List<Message> findByChannelId(int channelId) throws MeetingException {
		return exMessageDao.findByxMsgId(channelId);
	}
	*/
	@Transactional(rollbackFor = Exception.class)
	public void save(Message msg) throws MeetingException {
		try {
			if (msg.getId() == null) {
				exMessageDao.persist(msg);
			} else {
				exMessageDao.merge(msg);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	public List<Message> findByxMsgId(int xMsgId,byte sendOrDraft) throws MeetingException {
		return exMessageDao.findByxMsgId(xMsgId,sendOrDraft);
	}
	
	public List<Message> findByxMsgIdUserId(int xMsgId,String UserId,byte sendOrDraft) throws MeetingException {
		return exMessageDao.findByxMsgIdUserId(xMsgId,UserId,sendOrDraft);
	}
	
	public List<Message> findByUserId(String UserId,byte sendOrDraft) throws MeetingException {
		return exMessageDao.findByUserId(UserId,sendOrDraft);
	}

	public Message findByMsgId(int msgId) throws MeetingException {
		return exMessageDao.findById(msgId, Message.class);
	}
	
	public ExMessageDao getExMessageDao() {
		return exMessageDao;
	}

	public void setExMessageDao(ExMessageDao exMessageDao) {
		this.exMessageDao = exMessageDao;
	}

}
