<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex08_redirect.jsp</title>
</head>
<body>
	<h1>ex08_redirect.jsp페이지 입니다.</h1>
	<h2>redirect방식으로 페이지 이동을 할 예정입니다.</h2>
	<h3>클라이언트(브라우저)의 요청 url을 이동할 페이지의 url로 바꾸고 새롭게 서버에 
	요청을 보내는 방식으로 이동한다.</h3>
	<h3>따라서 브라우저(client)의 url부분에는 이동한 페이지의 url이 나타난다.</h3>
	<hr color="green">
	<% 
	//내장객체: response (HttpServletResponse타입)
		response.sendRedirect("ex01.jsp");
		System.out.println("여기를 수행할까요?");
	%>
	
	
</body>
</html>