package com.carrot.marketapp.model.service;

import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrot.marketapp.config.mail.MailHandler;

@Service
public class MailService {

	@Autowired
	private MailHandler mailHandler;

	public void mailSend(HttpSession session, Map map) throws MessagingException {
		String htmlContent;
		mailHandler.setFrom();
		mailHandler.setTo((String) map.get("email"));
		if (map.get("type") == null) {
			mailHandler.setSubject("자바라 인증번호입니다.");
			htmlContent = "<p>인증번호는 " + map.get("random") + "</p>";
		} else {
			mailHandler.setSubject("자바라 임시 비밀번호입니다.");
			htmlContent = "<p>임시비밀번호는 " + map.get("random") + "</p>";
		}
		mailHandler.setText(htmlContent, true);

		mailHandler.send();

	}

}
