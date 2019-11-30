package com.mvc.smartkart.dao;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class EmailDAO {

	   public static void send(String from,String password,String to,String sub,String msg){  
		   
		   

			/**
			 *
			 * @author 	: Midhun Prem
			 * @date   	: 16/11/2019
			 * @version	: 1.0
			 * @see		: Nothong
			 * @purpose	: Sent email alerts
			 * @param  	: String values
			 * @return 	: Nothing
			 
			 */
		   
	          //Get properties object    
	          Properties props = new Properties();    
	          props.put("mail.smtp.host", "smtp.gmail.com");    
	          props.put("mail.smtp.socketFactory.port", "465");    
	          props.put("mail.smtp.socketFactory.class",    
	                    "javax.net.ssl.SSLSocketFactory");    
	          props.put("mail.smtp.auth", "true");    
	          props.put("mail.smtp.port", "465");    
	          //get Session   
	          Session session = Session.getDefaultInstance(props,    
	           new javax.mail.Authenticator() {    
	           protected PasswordAuthentication getPasswordAuthentication() {    
	           return new PasswordAuthentication(from,password);  
	           }    
	          });    
	          //compose message    
	          try {    
	           MimeMessage message = new MimeMessage(session);    
	           message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
	           message.setSubject(sub);    
	           message.setText(msg);    
	           //send message  
	           Transport.send(message);    
	           System.out.println("message sent successfully");    
	          } catch (MessagingException e) {throw new RuntimeException(e);}    
	             
	    }  


	/* public static void main(String[] args) {    
	     //from,password,to,subject,message  
	    send("vinodkavya27@gmail.com","jasKAV123##","nimishapjayan@gmail.com","hello javatpoint","How r u?");  
	     //change from, password and to  
	 }  */  

	
	
}
