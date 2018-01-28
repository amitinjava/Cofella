package com.edspread.meeting.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.io.FileUtils;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;



public class ApplicationUtillty {
	private EmailSettings settings;

	
	
	
	public  boolean sendMail2Users(List<String> to, String text,
			String fromUser, String senderName, String subject, List<File> files) {
		if(!settings.getMode().equals("live")){
			return true;
		}
		Properties props = new Properties();
		//props.put("mail.smtp.user", settings.getUsername());
		props.put("mail.smtp.host", settings.getHost());
		if (!"".equals(settings.getPort()))
			props.put("mail.smtp.port", settings.getPort());
		if (!"".equals("true"))
			props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.auth", "true");
		if (settings.isDebug()) {
			props.put("mail.smtp.debug", "true");
		}else{
			props.put("mail.smtp.debug", "false");
		}
		if (!"".equals(settings.getPort()))
			props.put("mail.smtp.socketFactory.port", settings.getPort());
		if (!"".equals(settings.getSocketFactoryClass()))
			props.put("mail.smtp.socketFactory.class",
					settings.getSocketFactoryClass());
		if (!"".equals("false"))
			props.put("mail.smtp.socketFactory.fallback", "false");
		try {
			Session session = Session.getDefaultInstance(props, null);
			session.setDebug(true);
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(fromUser,"Text Time Machine"));
			msg.setSubject(subject);
			msg.setContent(text, "text/html");
			for (int i = 0; i < to.size(); i++) {
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(
						to.get(i)));
			}

			msg.saveChanges();

			Transport transport = session.getTransport("smtp");
			transport.connect(settings.getHost(), settings.getUsername(),
					settings.getPassword());
			transport.sendMessage(msg, msg.getAllRecipients());
			transport.close();
			return true;
		} catch (Exception mex) {
			mex.printStackTrace();
			return false;
		}

	}

	public boolean copyFile(String srcPath, String destPath) {
		try {
			File srcFile = new File(srcPath);
			System.out.println("srcFile" + srcFile.getAbsolutePath());
			File destFile = new File(destPath);
			System.out.println("destFile" + destFile.getAbsolutePath());
			FileUtils.copyFile(srcFile, destFile);
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}
	
	public boolean copyDirectory(String srcPath, String destPath) {
		try {
			File srcFile = new File(srcPath);
			System.out.println("srcFile" + srcFile.getAbsolutePath());
			File destFile = new File(destPath);
			if(!destFile.exists()){
				destFile.mkdirs();
			}
			System.out.println("destFile" + destFile.getAbsolutePath());
			FileUtils.copyDirectory(srcFile, destFile);
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}
	public List<String> parsePageHeaderInfo(String urlStr) throws Exception {

	    StringBuilder sb = new StringBuilder();
	    Connection con = Jsoup.connect(urlStr);
	    /* this browseragant thing is important to trick servers into sending us the LARGEST versions of the images */
	    con.userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36");
	    Document doc = con.get();
	    List<String> data = new ArrayList<>();
	    String text = null;
	    Elements metaOgTitle = doc.select("meta[property=og:title]");
	    if (metaOgTitle!=null) {
	        text = metaOgTitle.attr("content");
	    }
	    else {
	        text = doc.title();
	    }

	    String imageUrl = null;
	    Elements metaOgImage = doc.select("meta[property=og:image]");
	    if (metaOgImage!=null) {
	        imageUrl = metaOgImage.attr("content");
	    }

	   /* if (imageUrl!=null) {
	        sb.append("<img src='");
	        sb.append(imageUrl);
	        sb.append("' align='left' hspace='12' vspace='12' width='150px'>");
	    }

	    if (text!=null) {
	        sb.append(text);
	    }*/
        data.add(text);
        data.add(imageUrl);
	    return data;       
	}
	
	
	public EmailSettings getSettings() {
		return settings;
	}

	public void setSettings(EmailSettings settings) {
		this.settings = settings;
	}

}
