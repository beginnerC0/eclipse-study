<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ex12_response.jsp -->

	<h1>response내장 객체: HttpServletResponse타입</h1>

	<h2 style='color:red'><%=request.getAttribute("msg") %></h2>

	<form name="f" action="ex12_responseResult.jsp">
		<label for="id">아이디</label>
		<input type="text" name="id" id="id" placeholder="ID"
		 class="form-control">
		 
		 <label for="pwd">비밀번호</label>
		<input type="password" name="pwd" id="pwd"
		 placeholder="Password"
		 class="form-control">
		<button class="btn btn-success">로그인</button>
	</form>