<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	function check(){
		if(!frm.empno.value){
			alert('사번이 입력되지 않았어요');
			frm.empno.focus();
			return;
		}
		if(!frm.java.value){
			frm.java.value=0;
		}
		if(!frm.database.value){
			frm.database.value=0;
		}
		if(!frm.jsp.value){
			frm.jsp.value=0;
		}
		
		
		frm.submit();
	}

</script>    
    
<form name="frm" action="result.jsp" method="post">
	<table border="1">
		<tr>
			<td colspan="2">
				사번
			</td>
			<td>
				<input type="text" name="empno">
			</td>
		</tr>
		<tr>
			<td rowspan="3">
				과목
			</td>
			<td>
				Java
			</td>
			<td>
				<input type="text" name="java">
			</td>
		</tr>
		<tr>
			<td>
				DataBase
			</td>
			<td>
				<input type="text" name="database">
			</td>
		</tr>
		<tr>
			<td>JSP</td>
			<td>
				<input type="text" name="jsp">
			</td>
		</tr>
		<tr>
			<td colspan="3" align="center">
				<button type="button" onclick="check()">저장</button>
			</td>
		</tr>
	</table>
</form>