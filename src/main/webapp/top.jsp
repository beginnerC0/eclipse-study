<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.domain.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::TIS::</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<%
	//컨텍스트명을 얻어오자.
	String myctx=request.getContextPath();
	//System.out.println(myctx);//  /MyWeb
	
	//세션에 저장된 loginUser를 꺼내보자.
	UserVO loginUser=(UserVO)session.getAttribute("loginUser");
	String loginTime=(String) session.getAttribute("loginTime");
	boolean isLogin=(loginUser==null)? false:true;
	
%>
<div class="jumbotron text-center" style="margin-bottom:0">
	<h1>TIS Shop</h1>
	<p>Enjoy Shopping</p>
</div>
<!-- navbar-------------------------------- -->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand -->
  <a class="navbar-brand" href="<%=myctx%>/index.jsp">TIS</a>

  <!-- Links -->
  <ul class="navbar-nav">
  <%if(isLogin){ %>
    <li class="nav-item bg-primary">
      <a class="nav-link text-white" href="#">[<%=loginUser.getUserid() %>]님 로그인중...
      <%--loginTime --%></a>
    </li>
  <%}else{%>  
    <li class="nav-item">
      <a class="nav-link" href="<%=myctx%>/login/login.jsp">Login</a>
    </li>
  <%} 
  if(isLogin){%> 
    <li class="nav-item">
      <a class="nav-link" href="<%=myctx%>/login/logout.jsp">Logout</a>
    </li>
  <%} %> 
    <li class="nav-item">
      <a class="nav-link" href="<%=myctx%>/member/join.jsp">Join</a>
    </li>
     <li class="nav-item">
      <a class="nav-link" href="<%=myctx%>/member/list.jsp">Users</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="<%=myctx%>/member/edit.jsp">MyPage</a>
    </li>
    

    <!-- Dropdown -->
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        Dropdown link
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#">Link 1</a>
        <a class="dropdown-item" href="#">Link 2</a>
        <a class="dropdown-item" href="#">Link 3</a>
      </div>
    </li>
  </ul>
</nav>
<!-- -------------------------------------- -->

<!-- container  content-------------------- -->
<div class="container mt-5" style="height:700px;overflow: auto">
	<div class="row">
		<div class="col-md-9">