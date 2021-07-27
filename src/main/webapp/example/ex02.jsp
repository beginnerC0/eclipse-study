<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%
//scriptlet 태그: 이 안에서는 자바 코드를 자유자재로 사용할 수 있다.
	Date d=new Date();
	Random r=new Random();
	
	out.println("<h1>"+d.toString()+"</h1>");//[출력방법1]
%>

<!-- [출력방법1] 출력식(expression)을 사용하는 방법-->
<h1 style="color:green"><%= r.nextInt(100) %></h1>

<%--
for루프 이용해서 Hello를 5번 출력하기 <h2>태그로
 --%>
<% 
	for(int i=0;i<5;i++){
		out.println("<h2>Hello "+i+"</h2>");
	}
%> 
<hr color='red'>
<%--for루프 이용해서 Hi 5번 출력하되 <%= %>출력식을 이용해서 출력해보기 --%>
<% 
	for(int i=0;i<5;i++){
%>		
	<h2>Hi <%=i%> </h2>
<%		
	}

%>









