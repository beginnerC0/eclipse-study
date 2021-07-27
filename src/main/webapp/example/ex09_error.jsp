<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="myerror.jsp" %>    
<!-- 이 페이지에서 발생한 에러를 myerror.jsp에서 처리해 보여주겠다고 지정
그러면 myerror.jsp에서는 isErrorPage속성 값을 true로 주어야 한다.
 -->
    
<h1>JSP페이지에서 발생된 Error를 처리하는 방법을 살펴보자</h1>
<h2>page지시어에 에러를 처리할 페이지를 기술한다. errorPage라는 속성을 이용</h2>    
<%
	String str="100a";

%>
<h1><%=str %></h1>
<%
	int num=Integer.parseInt(str);
	out.println(num*2);
%>