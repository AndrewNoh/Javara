package com.carrot.marketapp.config.websocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration("chatServer")
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {
	@Autowired
	private WebSocketHandler webSocketHandler;

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(webSocketHandler, "/chat-ws.do/{roomno}").setAllowedOrigins("*");
		registry.addHandler(webSocketHandler, "/chat-ws.do/{roomno}").setAllowedOrigins("*").withSockJS();
	}
}
