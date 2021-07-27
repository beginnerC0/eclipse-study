<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 로그인 체크 모듈 include (소스를 포함시키는 방식으로) -->
<%@ include file="/login/loginCheckModule.jsp" %>
<!-- ----------------------------------------- -->
<jsp:include page="/top.jsp"/>

	<h1 class="text-center text-secondary">회원인증 페이지</h1>
	<h2 class="text-center text-danger">회원들만 들어올 수 있는 페이지입니다</h2>
	<h2 class="text-center text-info"><%=member.getName() %>[<%=member.getUserid() %>]님 환영합니다</h2>
<jsp:include page="/foot.jsp"/>