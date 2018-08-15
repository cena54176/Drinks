package com.mem.model;


import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailService {
		

		public void sendMail(String to, String subject, String messageText) {
				
		   try {
			
			   Properties props = new Properties();
			   props.put("mail.smtp.host", "smtp.gmail.com");
			   props.put("mail.smtp.socketFactory.port", "465");
			   props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
			   props.put("mail.smtp.auth", "true");
			   props.put("mail.smtp.port", "465");

		     final String myGmail = "ca101g2db@gmail.com";
		     final String myGmail_password = "ca101g2db";
		     
			   Session session = Session.getInstance(props, new Authenticator() {
				   protected PasswordAuthentication getPasswordAuthentication() {
					   return new PasswordAuthentication(myGmail, myGmail_password);
				   }
			   });

			   Message message = new MimeMessage(session);
			   message.setFrom(new InternetAddress(myGmail));
			   message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
			  
			   //���蕭謍舐���蕭���蕭謑�  
			   message.setSubject(subject);
			   //���蕭謍舐���蕭���嚙� 
			   message.setText(messageText);

			   Transport.send(message);
			   System.out.println("嚙踐齒嚙踐撮嚙踐�蕭嚙�!");
	     }catch (MessagingException e){
		     System.out.println("嚙踐齒嚙踐撒隞蕭嚙踝蕭!");
		     e.printStackTrace();
	     }
	   }

}
