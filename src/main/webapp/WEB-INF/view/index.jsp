<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BORAJI.COM</title>
<script type="text/javascript">
	//Open the web socket connection to the server
	var socketConn = new WebSocket(
			'ws://localhost:8080/ProjectCuoiKi/socketHandler');

	//Client Send Message 
	function send() {
		var clientMsg = document.getElementById('clientMsg');
		if (clientMsg.value) {
			socketConn.send(clientMsg.value);
			clientMsg.value = '';
		}
	}

	//Server Recive Message
	socketConn.onmessage = function(event) {
		var serverMsg = document.getElementById('serverMsg');
		serverMsg.value = event.data;
	}

	//Server Send Message 
	function sendServer() {
		var serverMsg = document.getElementById('serverMsg');
		console.log(serverMsg.value);
		if (serverMsg.value) {
			socketConn.send(serverMsg.value);
			serverMsg.value = '';
		}
	}
</script>
</head>
<body>
	<h1>Spring MVC 5 + WebSocket + Hello World example</h1>
	<hr />
	<label>Message</label>
	<br>
	<textarea rows="8" cols="50" id="clientMsg"></textarea>
	<br>
	<button onclick="send()">Send</button>
	<br>
	<label>Response from Server</label>
	<br>
	<textarea rows="8" cols="50" id="serverMsg"></textarea>
	<br>
	<button onclick="sendServer()">Send</button>
</body>
</html>