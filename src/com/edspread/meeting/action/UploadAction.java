package com.edspread.meeting.action;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;








import com.opensymphony.xwork2.ActionSupport;
import com.edspread.meeting.constants.MeetingConstant;
import com.edspread.meeting.entity.User;
import com.edspread.meeting.util.SessionUtil;

public class UploadAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	private File[] attachment;

	private Exception exception;
	
	private String[] attachmentFileName;
	
	private String attachmentContentType;
	
	private String uploaddedFilesNameOnServer ;
	
	private String nameOfFileToBeRemoved;
	
	private String uploadFileName;
		

	public String getUploaddedFilesNameOnServer() {
		return uploaddedFilesNameOnServer;
	}




	public void setUploaddedFilesNameOnServer(String uploaddedFilesNameOnServer) {
		this.uploaddedFilesNameOnServer = uploaddedFilesNameOnServer;
	}

	private static final Logger log = Logger.getLogger(UploadAction.class);
	
		

	public File[] getAttachment() {
		return attachment;
	}




	public void setAttachment(File[] attachment) {
		this.attachment = attachment;
	}




	public Exception getException() {
		return exception;
	}




	public void setException(Exception exception) {
		this.exception = exception;
	}




	public String[] getAttachmentFileName() {
		return attachmentFileName;
	}




	public void setAttachmentFileName(String[] attachmentFileName) {
		this.attachmentFileName = attachmentFileName;
	}




	public String getAttachmentContentType() {
		return attachmentContentType;
	}




	public void setAttachmentContentType(String attachmentContentType) {
		this.attachmentContentType = attachmentContentType;
	}

	


	public String getNameOfFileToBeRemoved() {
		return nameOfFileToBeRemoved;
	}




	public void setNameOfFileToBeRemoved(String nameOfFileToBeRemoved) {
		this.nameOfFileToBeRemoved = nameOfFileToBeRemoved;
	}




	private String uploadFile(String type) {
		try {
			if (type.equals("Temp")) {
				for(int i=0;i<attachment.length;i++){
					if(attachment[i]!=null && attachment[i].exists()){
						
						if(attachment[i] != null){
							int pos = attachmentFileName[i].lastIndexOf(".");
							String fileName = attachmentFileName[i].substring(0, pos);
							String ext = attachmentFileName[i].substring(pos + 1,
									attachmentFileName[i].length());
							
							if (attachment[i] != null) {
								String key = "";
								key = fileName + "." + ext;
								uploadFileName = key;
								String actualFilePath = SessionUtil.getServerDeploymentPath() + File.separator + MeetingConstant.UPLOADDIR + File.separator + key;
								File destFile = new File(actualFilePath);
								FileUtils.copyFile(attachment[i], destFile);
								System.out.println("Uploaded path::"+destFile.getAbsolutePath());
								//uploaddedFilesNameOnServer = Constants.TEMP + "/" + key;
							} 
						}
						
					}
				}
			}
		} catch (Exception e) {
			if(e.getMessage() != null && e.getMessage().length() > 0){
				// get logs
				log.error("[ERROR:] "+e.getMessage());
			}
		}
		return "success";
	}
	

	public String uploadAttachedRef() {
		try {
			User user = (User) SessionUtil.getSession().get(
					MeetingConstant.USER_SESSION_VAR);
			if(user != null){
				for(int i=0;i<attachment.length;i++){
						if(attachment[i]!=null && attachment[i].exists()){
							if(attachment[i] != null){
								int pos = attachmentFileName[i].lastIndexOf(".");
								String fileName = attachmentFileName[i].substring(0, pos);
								String ext = attachmentFileName[i].substring(pos + 1,
										attachmentFileName[i].length());
								
								if (attachment[i] != null) {
									String key = "";
									key = fileName + "." + ext;
									String actualFilePath = SessionUtil.getServerDeploymentPath() + File.separator +  MeetingConstant.ENOTEBOOK + File.separator
											+ user.getEmail() + File.separator + uploadFileName + File.separator + key;
									File destFile = new File(actualFilePath);
									FileUtils.copyFile(attachment[i], destFile);
									System.out.println("Uploaded path::"+destFile.getAbsolutePath());
									uploadFileName = key;
									//uploaddedFilesNameOnServer = Constants.TEMP + "/" + key;
								} 
							}
							
						}
				}
			}
			
		} catch (Exception e) {
			if(e.getMessage() != null && e.getMessage().length() > 0){
				// get logs
				log.error("[ERROR:] "+e.getMessage());
			}
		}
		return "success";
	}
	
	public String uploadVideoFile() {
		try {
			System.out.println("attachment::"+attachment.length);
			for(int i=0;i<attachment.length;i++){
				if(attachment[i]!=null && attachment[i].exists()){
					
					if(attachment[i] != null){
						System.out.println("attachment::"+attachmentFileName[i]);
						int pos = attachmentFileName[i].lastIndexOf(".");
						String fileName = attachmentFileName[i].substring(0, pos);
						String ext = attachmentFileName[i].substring(pos,
								attachmentFileName[i].length());
						
						if (attachment[i] != null) {
							String key = "";
							key = fileName + ext;
							String actualFilePath = SessionUtil.getServerDeploymentPath() + File.separator + MeetingConstant.UPLOADDIR + File.separator + key;
							File destFile = new File(actualFilePath);
							FileUtils.copyFile(attachment[i], destFile);
							System.out.println("ext::::"+ext);
							if(MeetingConstant.RECORDINGFILEFORMAT.equalsIgnoreCase(ext)){
								uploadFileName = fileName + MeetingConstant.RECORDINGFILEFORMAT;
								System.out.println("uploadFileName::;"+uploadFileName);
							}else{
								uploadFileName = convertFile(actualFilePath,fileName);
								System.out.println("uploadFileName::;"+uploadFileName);
							}
						} 
					}
					
				}
			}
			
		} catch (Exception e) {
			if(e.getMessage() != null && e.getMessage().length() > 0){
				// get logs
				log.error("[ERROR:] "+e.getMessage());
			}
		}
		return "success";
	}
	
	public String convertFile(String sourceFilePath,String fileName){
		String destFilePath = null;
		try {
			System.out.println("Convert File sourceFilePath::"+sourceFilePath);
			int pos = sourceFilePath.lastIndexOf(File.separator);
			destFilePath = sourceFilePath.substring(0, pos) + File.separator + fileName + MeetingConstant.RECORDINGFILEFORMAT;
			File srcfl = new File(sourceFilePath);
			System.out.println("SrcFile"+srcfl.exists());
			
			File fl = new File(destFilePath);
			//fl.createNewFile();
			System.out.println("convertFile destFilePath::"+destFilePath+"::"+fl.exists());
			ProcessBuilder pb = new ProcessBuilder("ffmpeg","-i",sourceFilePath,fl.getAbsolutePath());
            pb.start();
        } catch (IOException e) {
        	e.printStackTrace();
            return null;
        }catch (Exception e) {
			e.printStackTrace();
		}
        return (fileName + MeetingConstant.RECORDINGFILEFORMAT);
	}
	

	public String uploadTempFile() throws Exception {
				return uploadFile("Temp");
	}
	public String deleteTempFile(){
		try {
			if(nameOfFileToBeRemoved==null){
				addActionError("Invalid file name.");
				return "error";
			}else{
				//Thread delThread = new Thread(new DeleteTempraryFiles());				delThread.start();
			}
		}catch (Exception ex) {
			log.error("[ERROR:] "+ex.getMessage());
			addActionError("File could not be removed. Please try again.");
			return "error";
		}
		return "success";
	}




	public String getUploadFileName() {
		return uploadFileName;
	}




	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	
}