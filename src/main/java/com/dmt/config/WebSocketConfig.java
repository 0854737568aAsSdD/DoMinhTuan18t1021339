/*
*
*
*@author TuanDM21
*@date 16-12-2000
*@version 1.0
*/

package com.dmt.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.dmt.utills.MyWebSocketHandler;

@Configuration
@EnableWebSocket
@ComponentScan("com.dmt.*")
public class WebSocketConfig implements WebSocketConfigurer {

	@Autowired
	private MyWebSocketHandler myWebSocketHandler;

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(myWebSocketHandler, "/socketHandler");
	}

}