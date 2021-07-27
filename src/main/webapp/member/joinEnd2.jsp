<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="user.domain.UserVO" scope="page"/>
<jsp:setProperty property="*" name="user"  />
<%=user%>
<% 
	if(user.getName()==null||user.getUserid()==null){
		response.sendRedirect("join.jsp");
		return;
	}

%>

<%-- 
	UserVO user=new UserVO();
	useBean액션을 사용하면 해당 클래스의 객체를 생성해준다.
	기본생성자를 호출하므로 반드시 기본생성자가 있어야 한다.
	scope는 객체가 살아있는 범위를 지정
	page : 해당 페이지 요청이 있을 때마다 객체를 생성한다.
	request
	session: 하나의 브라우저 사용하는 동안 객체 1개를 공유한다.
	application: 서버가 startup하고 shutdown할 때까지 하나의 객체를 공유
	 
	 setProperty액션을 이용하면 아래 코드를 자동으로 해준다.
	 html의 input name과 Java Beans의 property name이 같아야 한다.
	 user.setName(request.getParameter("name"));
	 
--%>
<jsp:useBean id="userDao" class="user.persistence.UserDAO" scope="session"/>
<% 
	/*
	int n=0;
	for(int i=1;i<31;i++){
		user.setUserid(user.getUserid()+i);
		n=userDao.createUser(user);		
	}
	*/
	int n=userDao.createUser(user);
	String msg=(n>0)?"로그인 페이지로 이동합니다":"회원가입 실패";
	String loc=(n>0)?"../login/login.jsp":"javascript:history.back()";
%>
<script>
	alert('<%=msg%>');
	location.href='<%=loc%>';
</script>
















