<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- delete.jsp -->
<%
//[1] 삭제할 회원번호 받기
	String idx=request.getParameter("idx");
//[2] 유효성 체크 (null, 빈문자열 체크)
	if(idx==null||idx.trim().isEmpty()){
		response.sendRedirect("list.jsp");
		return;
	}
//[3] UserDAO빈 생성
//[4] int deleteUser(회원번호)
//[5] 결과에 따라서 메시지 보여주고 페이지 이동(list.jsp)
%>
<jsp:useBean id="userDao" class="user.persistence.UserDAO" scope="session"/>
<%
	int n=userDao.deleteUser(idx.trim());
	String msg=(n>0)?"회원정보 삭제 완료":"삭제 실패";
	String loc="list.jsp";
%>
<script>
	alert('<%=msg%>');
	location.href='<%=loc%>';
</script>
