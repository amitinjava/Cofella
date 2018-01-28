package com.edspread.meeting.dao;

import java.util.List;

import com.edspread.meeting.entity.UserDetails;
import com.edspread.meeting.util.MeetingException;


public class UserDetailsDao extends GenericDao<Integer, UserDetails> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public UserDetails findByUserId(Integer userId) throws MeetingException {
	    try {
	    	List<UserDetails> list = findByNamedQuery("UserDetails.findByUserId", "userId",
					userId);
			if (list.size() > 0) {
				return list.get(0);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    return null;
	}


}