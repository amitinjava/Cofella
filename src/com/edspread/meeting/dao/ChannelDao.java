package com.edspread.meeting.dao;

import java.util.List;

import com.edspread.meeting.entity.Channel;
import com.edspread.meeting.util.MeetingException;

public class ChannelDao extends GenericDao<Integer, Channel> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public List<Channel> findByOwner(String owner) throws MeetingException {
		List<Channel> list = findByNamedQuery("Channel.findByOwner", "owner",
				owner);
		
		return list;
	}
	
}
