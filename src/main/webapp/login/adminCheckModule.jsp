<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- adminCheckModule.jsp : 관리자 여부를 체크
	1. 로그인이 되어 있어야 함
	2. 정지회원이 아니어야 함
	3. id가 admin이어야 함
	
 -->
 <!-- 로그인 체크모듈 포함 ---------------------------->
 <%@ include file="/login/loginCheckModule.jsp" %>
 <!-- ---------------------------------------- -->
 <%
 	if(!member.getUserid().equals("admin")){
 		%>
 		<script>
 			alert('관리자만 이용 가능합니다');
 			history.back();
 		</script>
 		<%
 		return;
 	}
 %>