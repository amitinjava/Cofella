package com.edspread.meeting.util;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import com.edspread.meeting.constants.MeetingConstant;



public class DateUtil {
	
	public static Date getCurrentDateTime(){
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		return cal.getTime();
	}
	public static long getTimeInLong(){
		return System.currentTimeMillis();
	}
	public static String getFormattedDateTime (){
		Date dt = DateUtil.getTodayDate();
		SimpleDateFormat formatter = new SimpleDateFormat(MeetingConstant.DATE_FORMAT);
		return formatter.format(dt);
	}
	public static Date getTodayDate(){
		return new Date(new GregorianCalendar().getTimeInMillis());
	}
	
	public static String getLectureFormattedDateTime (Date date){
		
		SimpleDateFormat formatter = new SimpleDateFormat(MeetingConstant.LECTUREDATE_FORMAT);
		return formatter.format(date);
	}
	public static  Date convertDateInUserTimeZone(Date date,int offsetInMin) {
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(date);
		calendar.add(Calendar.MINUTE, offsetInMin);
		return calendar.getTime();
		
	}
	
}

