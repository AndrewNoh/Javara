package com.carrot.marketapp.config.mail;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component("mailHandler")
public class MailHandler {

	private JavaMailSender sender;
	private MimeMessage message;
	private MimeMessageHelper messageHelper;

	public MailHandler(JavaMailSender mailSender) throws MessagingException {
		this.sender = mailSender;
		message = mailSender.createMimeMessage();
		messageHelper = new MimeMessageHelper(message, true, "utf-8");
	}

	public void setFrom() throws MessagingException {
		messageHelper.setFrom("javara_@naver.com");
	}

	public void setTo(String email) throws MessagingException {
		messageHelper.setTo(email);
	}

	// 제목
	public void setSubject(String subject) throws MessagingException {
		messageHelper.setSubject(subject);
	}

	// 메일 내용
	public void setText(String text, boolean useHtml) throws MessagingException {
		messageHelper.setText(text, useHtml);
	}

	public void send() {
		try {
			sender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
