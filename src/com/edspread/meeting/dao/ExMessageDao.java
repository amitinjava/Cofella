package com.edspread.meeting.dao;

import java.util.List;

import com.edspread.meeting.entity.ExMessage;
import com.edspread.meeting.util.MeetingException;

public class ExMessageDao  extends GenericDao<Integer, ExMessage>{
private static final long serialVersionUID = 1L;
	
	public void saveChannelExMessage(int channel_id,int sequenceNo, String httpmessagepath, String localmessagepath, String created_by) throws MeetingException {
		saveChannelsExMessage(channel_id, sequenceNo,  httpmessagepath,  localmessagepath,  created_by);
		
		return;
	}

	public List<ExMessage> findByChannelId(int channelId) throws MeetingException {
		List<ExMessage> list = findByNamedQuery("exmessage.findByChannelid", "channel_id",
				channelId);
		
		return list;
	}

	public void getParticipants(int channelId, String email) {
		// TODO Auto-generated method stub
		
	}
}
