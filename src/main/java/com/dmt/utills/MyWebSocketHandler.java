/*
*
*
*@author TuanDM21
*@date 16-12-2000
*@version 1.0
*/

package com.dmt.utills;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class MyWebSocketHandler extends TextWebSocketHandler {

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		String clientMessage = message.getPayload();
		System.out.println(clientMessage);
		session.sendMessage(new TextMessage(clientMessage));
	}

}