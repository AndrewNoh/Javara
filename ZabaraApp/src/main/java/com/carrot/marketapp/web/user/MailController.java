package com.carrot.marketapp.web.user;

import java.util.Map;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.carrot.marketapp.model.dto.UserDTO;
import com.carrot.marketapp.model.service.MailService;
import com.carrot.marketapp.model.service.impl.UserServiceimpl;
import com.carrot.marketapp.util.SmsService;
import com.carrot.marketapp.util.certificationRandomNumber;

import oracle.jdbc.proxy.annotation.Post;

@Controller
public class MailController {
	
	@Autowired
	public MailService mailService;

	@Autowired
	public SmsService smsService;
	
	@Autowired
	UserServiceimpl userService;
	
	
	@RequestMapping(value="/phoneCheck.do",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String sendSMS(@RequestParam Map map) { // 휴대폰 문자보내기
		String userPhoneNumber = (String)map.get("phone");
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성
		//smsService.certifiedPhoneNumber(userPhoneNumber,randomNumber);
		return Integer.toString(randomNumber);
	}
	
	@PostMapping(value="/emailLink.do",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String sendMail(HttpServletRequest req, @RequestParam Map map) throws MessagingException {
		HttpSession session = req.getSession();
		String random = certificationRandomNumber.random();
		map.put("random", random);
		if(map.get("type")!=null) {//임시비밀번호 발급용
			UserDTO user=userService.selectOne(map);
			System.out.println(user);
			if(user ==null) return "notMember";
			map.put("temporaryPassword", random);
			userService.update(map);
		}
		mailService.mailSend(session,map);
		
		return random;
	}
	
	
}
