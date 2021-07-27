<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>include액션을 이용해 구구단 페이지를 포함시켜봅시다.</h1>
<h2>include액션은 소스를 포함시키는 방식이 아니라, 실행결과를 포함시키는 방식이다.</h2>
<h3>JSP흐름을 ex03.jsp로 이동시켜서 그 실행 결과문을 현재 위치에 포함시킨다.</h3>
<hr color='blue'>
<jsp:include page="ex03.jsp"/>