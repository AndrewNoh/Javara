package com.carrot.marketapp.config.websocket;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class WebSocketChatHandler extends TextWebSocketHandler {

	private Map<String, WebSocketSession> clients = new HashMap<>();

	// 클라이언트와 연결이 되었을때 호출되는 콜백 메소드]
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// -컬렉션에 연결된 클라이언트 추가
		clients.put(session.getId(), session);
		System.out.println(session.getId() + "연결 되었습니다");
	}

	// 클라이언트로 부터 메시지를 받았을때 자동 호출되는 콜백 메소드]
	// 여기서 클라이언트로 메시지도 보냄
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(session.getId() + "로부터 받은 메시지:" + message.getPayload());
		// 접속한 모든 클라이언트에게 session.getId()가 보낸 메시지 뿌려주기]
		for (WebSocketSession client : clients.values()) {
			if (!session.getId().equals(client.getId())) {// 자기가 보낸 메시지를 다시 받지 않도록
				client.sendMessage(message);
			}
		}
	}

	// 클라이언트와 통신장애시 자동으로 호출되는 메소드]
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println(session.getId() + "와 통신장애 발생:" + exception.getMessage());
	}

	// 클라이언트와 연결이 끊어졌을때 호출되는 콜백 메소드]
	// -컬렉션에 저장된 클라이언트 삭제
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		clients.remove(session.getId());
		System.out.println(session.getId() + "연결이 끊어졌어요");
	}

	@Override
	public void handleBinaryMessage(WebSocketSession session, BinaryMessage message) {
		// 바이너리 메시지 발송
		ByteBuffer byteBuffer = message.getPayload();

		for (WebSocketSession client : clients.values()) {
			if (!session.getId().equals(client.getId())) {// 자기가 보낸 메시지를 다시 받지 않도록
				try {
					client.sendMessage(new BinaryMessage(byteBuffer));
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

		}

	}
}
