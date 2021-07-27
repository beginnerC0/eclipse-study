<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
table  tr>td, h1{
	text-align:center;
}

</style>
<table border="1" style="width:200px;">
	<tr>
		<th>구구단 7단</th>
	</tr>
	<% 
	int dan=7;
	for(int i=1;i<10;i++){
	%>
	<tr>
		<td><%=dan%>x <%=i%> = <%=dan*i%> </td>
	</tr>
	<% 
	}//for----------
	%>
</table>  
<hr color='red'>
<h1>구구단 전체 테이블</h1>

<table border="1" style="width:90%;margin:auto;">
	<% 
	for(int i=1;i<10;i++){
	%>
	<tr>
		<%
		for(int k=2;k<10;k++){
		%>
		<td>
			<%=k %> x <%=i %> = <%=i*k %>
		</td>
		<% 
		}
		%>
	</tr>
	<% 
	}
	%>
</table>











  