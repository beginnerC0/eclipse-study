<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>    
	<h1>include지시어에 대해 살펴봅시다.</h1>
	<h2>현재 페이지는 ex05.jsp입니다.</h2>
	<h3>include지시어는 특정 페이지를 포함시키고자 할 때 사용합니다.</h3>
	<h3>include지시어를 사용하면 포함시킬 페이지의 소스코드를 삽입하는 형태로 포함시킵니다.</h3>
	<hr color='red'>
	
	<%@ include file="ex04.jsp" %>
	<!-- ex04.jsp의 서블릿 코드를 이곳에 삽입함 -->
	<% 
		//int str=100; 
		int global=200;
	%>
	<%=global%>
	<h3><%=this.global %></h3>
</div>