<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//자바, db, jsp 성적값 받기
	String empno=request.getParameter("empno");
	String java=request.getParameter("java");
	String db=request.getParameter("database");
	String jsp=request.getParameter("jsp");
	
	//out.println(empno);
	if(empno==null){
		%>
		<script>
			alert('잘못 들어온 경로입니다.');
			location.href='input.jsp';
		</script>
		<%
		return;
	}
	
	int java_int=Integer.parseInt(java);
	int db_int=Integer.parseInt(db);
	int jsp_int=Integer.parseInt(jsp);
	
	int sum=java_int+db_int + jsp_int;
	int avg=sum/3;
%>
<table border="1" style="width:200px">
<tr>
	<td colspan="2" width="40%">사번</td>	
	<td>
	<%=empno %>
	</td>
</tr>
<tr>
	<td rowspan="3">과목</td>
	<td>Java</td>
	<td><%=java %></td>
</tr>
<tr>
	<td>Database</td>
	<td><%=db%></td>
</tr>
<tr>
	<td>JSP</td>
	<td><%=jsp %></td>
</tr>
<tr>
	<td colspan="2">평균</td>	
	<td>
	<%=avg %>
	</td>
</tr>
<tr>
	<td colspan="3">
	
	<button onclick="location.href='input.jsp'">입력화면</button>
	</td>
	
</tr>

</table>







