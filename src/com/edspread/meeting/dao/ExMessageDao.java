package com.edspread.meeting.dao;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.edspread.meeting.entity.Message;
import com.edspread.meeting.util.MeetingException;

public class ExMessageDao  extends GenericDao<Integer, Message>{
private static final long serialVersionUID = 1L;
	
	public void saveChannelExMessage(int channel_id,int sequenceNo, String httpmessagepath, String localmessagepath, String created_by) throws MeetingException {
		saveChannelsExMessage(channel_id, sequenceNo,  httpmessagepath,  localmessagepath,  created_by);
		return;
	}

	public List<Message> findByxMsgId(int xMsgId,byte sendOrDraft) throws MeetingException {
		Map<String, Object> params = new LinkedHashMap();
		params.put("xMsgId", xMsgId);
		params.put("sendOrDraft", sendOrDraft);
		List<Message> list = findByNamedQueryRaw("message.findByxMsgId",params);
		return list;
	}

	public List<Message> findByxMsgIdUserId(int xMsgId,String UserId,byte sendOrDraft) throws MeetingException {
		Map<String, Object> params = new LinkedHashMap();
		params.put("xMsgId", xMsgId);
		params.put("created_by", UserId);
		params.put("sendOrDraft", sendOrDraft);
		List<Message> list = findByNamedQueryRaw("message.findMsgByxMsgIdUserId",params);
		return list;
	}
	
	public List<Message> findByUserId(String UserId,byte sendOrDraft) throws MeetingException {
		Map<String, Object> params = new LinkedHashMap();
		params.put("created_by", UserId);
		params.put("sendOrDraft", sendOrDraft);
		List<Message> list = findByNamedQueryRaw("message.findByUserId",params);
		return list;
	}
	
	
	public void getParticipants(int channelId, String email) {
		
	}
}
