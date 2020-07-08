package com.chinasofti.ssm.entity;

import java.security.GeneralSecurityException;
import java.security.NoSuchProviderException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.chinasofti.ssm.dao.EmailPostDao;
import com.sun.mail.util.MailSSLSocketFactory;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
@Component
public class EmailPostService implements EmailPostDao {
	@Autowired
	private JavaMailSender mMailSender;
	 public  String sendmail(String email,String team_id){
		 SimpleMailMessage message = new SimpleMailMessage();
         message.setTo(email);  //设置发送到哪个邮箱，可设置多个
         message.setFrom("1976416216@qq.com");  //设置从哪个邮箱发送
        // Date date = Calendar.getInstance().getTime();
         //String subject = DATE_FORMAT.format(date) + SUBJECT_PREFIX;
         message.setSubject("主题：您的申请已通过");
         message.setText("正文：你的"+team_id+"组织申请已被通过，请尽快登录并完善相关资料。");
         mMailSender.send(message);
         return "1";
         
         
    }
	 public  String sendmail(String email,String team_id,String value){
		 SimpleMailMessage message = new SimpleMailMessage();
         message.setTo(email);  //设置发送到哪个邮箱，可设置多个
         message.setFrom("1976416216@qq.com");  //设置从哪个邮箱发送
        // Date date = Calendar.getInstance().getTime();
         //String subject = DATE_FORMAT.format(date) + SUBJECT_PREFIX;
         message.setSubject("主题：您的申请已驳回");
         message.setText("正文：你的"+team_id+"组织申请已被驳回，驳回理由是："+value);
         mMailSender.send(message);
         return "1";
         
         
    }
	
}
