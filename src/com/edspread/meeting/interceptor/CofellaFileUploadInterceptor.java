package com.edspread.meeting.interceptor;

import java.io.File;
import java.util.Locale;

import org.apache.struts2.interceptor.FileUploadInterceptor;

import com.opensymphony.xwork2.ValidationAware;

public class CofellaFileUploadInterceptor extends FileUploadInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected boolean acceptFile(Object arg0, File arg1, String arg2, String contentType, String arg4, ValidationAware arg5,
			Locale arg6) {
		System.out.println(contentType);
		return super.acceptFile(arg0, arg1, arg2, contentType, arg4, arg5, arg6);
	}

}
