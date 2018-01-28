package com.edspread.meeting.util;


import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

import org.joda.time.DateTime;
import org.joda.time.DateTimeZone;

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
	
	/**
	 * @return
	 */
	public static Date getCurrentDateTimeInGMT() {
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.MILLISECOND, cal.getTimeZone().getRawOffset() * (-1));
		return cal.getTime();
	}

	
	/**
	 * @return
	 */
	public static Calendar getCustomCalendarInstance() {
		Calendar cal = Calendar.getInstance();
		cal.setFirstDayOfWeek(0);
		return cal;
	}

	/**
	 * @param currentDate
	 * @param noOfDays
	 * @return
	 */
	public static Date getPreviousDateByDays(Date currentDate, int noOfDays) {
		Calendar currentCalander = Calendar.getInstance();
		currentCalander.setTime(currentDate);
		currentCalander.add(Calendar.DAY_OF_YEAR, -noOfDays);
		return currentCalander.getTime();
	}

	/**
	 * @param date
	 * @return
	 */
	public static long getTimeInMilis(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.getTimeInMillis();
	}

	/**
	 * @param date
	 * @return
	 */
	public static Date convertToDateObject (String dateinStr,String format ) {
		 Date date = null;
		 if(dateinStr !=null  && !dateinStr.equals("")){
			 try {
				 DateFormat df = new SimpleDateFormat(format); 
				 date = df.parse(dateinStr);
			        
			    } catch (ParseException e) {
			        e.printStackTrace();
			    }
		 }
		 
		 return date;
	}
	
	public static String convertToStringObject (Date date,String format ) {
		String dateStr = null;
		if(date != null){
		 DateFormat df = new SimpleDateFormat(format); 
		 dateStr = df.format(date);
		}
		 return dateStr;
	}
	public static String convertToStringObject (Date date,String format,String timeZone ) {
		DateTime now = new DateTime(date, DateTimeZone.forID(timeZone));
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		System.out.println("TimeZone:::::::::::::"+cal.getTimeZone());
		cal.set(Calendar.YEAR,now.getYear());
		cal.set(Calendar.MONTH,now.getMonthOfYear());
		cal.set(Calendar.DAY_OF_MONTH,now.getDayOfMonth());
		cal.set(Calendar.HOUR_OF_DAY,now.getHourOfDay());
		cal.set(Calendar.MINUTE,now.getMinuteOfHour());
		cal.set(Calendar.SECOND,now.getSecondOfMinute());
		cal.set(Calendar.MILLISECOND,now.getMillisOfSecond());
		System.out.println("Time After conversion"+cal.getTime());
		String dateStr = null;
		if(cal.getTime() != null){
		  DateFormat df = new SimpleDateFormat(format); 
		  dateStr = df.format(cal.getTime());
		}
		 return dateStr;
	}
	
	
	
	
	public static Timestamp convertStrtDatetoTimeStamp(String dateStr) {
		Date date = convertToDateObject(dateStr,"MM/dd/yyyy");
		if(date!= null){
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			Timestamp tm = new Timestamp(cal.getTimeInMillis());
			return tm;
		}else
			return null;
		
	}
	public static String convertTimeStampToDateStr(Timestamp timestamp) {
		if(timestamp != null){
			Calendar cal = Calendar.getInstance();
			cal.setTimeInMillis(timestamp.getTime());
		return convertToStringObject(cal.getTime(),"MM/dd/yyyy");
		}else 
			return null;
		
	}
	
	/**
	 * @param sourceDate
	 * @return
	 */
	public static String  convertDateFormat(String sourceDate) {
		String formattedDate = "";
		DateFormat readFormat = new SimpleDateFormat("MMM dd yyyy hh:mmaaa", Locale.US);

		DateFormat writeFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date date = null;
		try {
			date = readFormat.parse(sourceDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		if (date != null) {
			formattedDate = writeFormat.format(date);
		}
		return formattedDate;
		
	}
	
	public static void main(String[] args) {
		//System.out.println("date"+DateUtils.convertToStringObject(DateUtils.getCurrentDateTime(), "EEE, d MMM yyyy"));
		System.out.println("date"+convertToStringObject(getCurrentDateTime(), "dd MMMM, yyyy"));
		
		System.out.println("date"+convertToDateObject("06 December, 2017", "dd MMMM, yyyy"));
	}
	
}

