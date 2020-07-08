package com.chinasofti.ssm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chinasofti.ssm.dao.UserInfoDao;
import com.chinasofti.ssm.entity.EmailPostService;
import com.chinasofti.ssm.entity.Show;
import com.chinasofti.ssm.entity.UserInfo;
import com.google.gson.Gson;
@Controller
public class TestController {
	@Autowired
	private UserInfoDao userinfoservice;
	@Autowired
	private JavaMailSender mMailSender;
	@RequestMapping(value="index",produces = "text/json;charset=UTF-8")
	public void index(HttpServletResponse response){
	
	
		/*String result="";
		response.setCharacterEncoding("utf-8");
		List<UserInfo> userinfo=userinfoservice.getUserInfoList();
		try {
			PrintWriter out=response.getWriter();
			Show he=new Show();
			he.setData(userinfo);
			result=new Gson().toJson(he);
			out.print(result);
			out.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//return "index";*/
		 SimpleMailMessage message = new SimpleMailMessage();
         message.setTo("2536060814@qq.com");  //设置发送到哪个邮箱，可设置多个
         message.setFrom("1976416216@qq.com");  //设置从哪个邮箱发送
         message.setSubject("主题：您的申请已通过");
         message.setText("正文：你的"+"222"+"组织申请已被通过，请尽快登录并完善相关资料。");
         mMailSender.send(message);
		
	}
}
