package com.edspread.meeting.util;


public class MeetingException extends java.lang.Exception {

	private static final long serialVersionUID = 1L;
	
	public MeetingException(String message, Throwable cause)
	{
		super(message, cause);
	}
	
	public MeetingException(Throwable cause)
	{
		super(cause);
	}
	
	public MeetingException(String message)
	{
		super(message);
	}
}
