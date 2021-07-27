<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex07_forwardAction.jsp</title>
</head>
<body>
	<h1>ex07_forwardAction.jsp페이지 입니다.</h1>
	<h2>forward액션을 통해 페이지 이동을 할 예정입니다.</h2>
	<h3>서버 내부에서 페이지 이동이 일어난다.</h3>
	<h3>브라우저(client)의 url부분에는 이전 페이지의 url이 나타난다.</h3>
	<hr color="green">
	<jsp:forward page="ex03.jsp"/>
	
</body>
</html>