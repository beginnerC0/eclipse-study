<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.util.*,java.text.*" %>

<%--    

<%@page %> : page directive (페이지 지시어)

--%>

<!--[1] html주석: 여기는 html영역 -->
<h1>처음 해보는 JSP</h1>

<%
 //[2] 여기는 자바 영역 -자바주석
 /*
 */
 	Date d=new Date();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	String str=sdf.format(d);
	//내장객체: out ==> JspWriter타입
	out.println("<h1>"+str+"</h1>");			
%>

<%--[3] JSP주석 --%>