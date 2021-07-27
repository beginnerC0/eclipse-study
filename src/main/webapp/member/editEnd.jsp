<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	[1] post방식 인코딩 처리
	
	
	[2] 사용자가 입력한 값 받기==>UserVO에 담기
	==> useBean액션과 setProperty이용해서 
	==>브라우저에 출력해보기
	
	[3] UserDAO빈 생성
	
	[4] UserDAO의 int updateUser(UserVO객체) 호출
--%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="user.domain.UserVO" scope="page"/>
<jsp:setProperty name="user" property="*"/>

<jsp:useBean id="userDao" class="user.persistence.UserDAO" scope="session" />
<% 
	int n = userDao.updateUser(user);          

	String msg=(n>0)? "수정 처리 완료":"수정 실패";
	String loc=(n>0)? "edit.jsp?idx="+user.getIdx(): "javascript:history.back()";
%> 
<script>
	alert('<%=msg%>');
	location.href='<%=loc%>';
</script>
<%
	String mode=(String) session.getAttribute("mode");
	if(mode==null) return;
	if(mode.equals("1")&& user.getMstate()==0){
		session.invalidate();	
		response.sendRedirect("../login/login.jsp");
	}
%>













