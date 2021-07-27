<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cbean" class="beans.count.CountBean"
 scope="request"/> 
<h1>result3.jsp</h1>
<h2 style="color:green">
<jsp:getProperty property="count" name="cbean"/>
</h2>
<a href="result2.jsp">result2.jsp로 이동</a>