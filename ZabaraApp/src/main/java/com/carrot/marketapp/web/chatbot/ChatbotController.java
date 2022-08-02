package com.carrot.marketapp.web.chatbot;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chatbot")
public class ChatbotController {
	
	@RequestMapping("/chatbot.do")
	public String chatbot() {
		//뷰정보 반환]
		return "/chatbot/Chatbot.market";
	}///////////handlerMapping
	
}
