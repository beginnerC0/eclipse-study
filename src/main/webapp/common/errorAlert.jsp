<%@page import="user.persistence.NotUserException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<% 
	//IE 의 경우 자체적으로 에러 처리를 하려고 함
	//그래서 에러가 아닌것 처럼 가장
	response.setStatus(200);
	if(exception instanceof NotUserException){
		
	
%>
<script>
	alert('<%=exception.getMessage()%>');
	history.back();
</script>
<%}else{%>
<div class="container">
	<div class="alert alert-danger">
		<h3>서버 에러 발생: <%=exception.getMessage() %></h3>
	</div>
</div>

<%}%>