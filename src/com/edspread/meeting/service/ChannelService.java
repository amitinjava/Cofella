package com.edspread.meeting.service;

import java.util.List;

import com.edspread.meeting.dao.ChannelDao;
import com.edspread.meeting.entity.Channel;
import com.edspread.meeting.util.MeetingException;

public class ChannelService {

	private ChannelDao channelDao;

	public List<Channel> findByOwner(String owner) throws MeetingException {
		return channelDao.findByOwner(owner);
	}

	public ChannelDao getChannelDao() {
		return channelDao;
	}

	public void setChannelDao(ChannelDao channelDao) {
		this.channelDao = channelDao;
	}

	
}
