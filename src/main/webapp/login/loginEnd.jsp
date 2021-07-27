<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.domain.*" errorPage="/common/errorAlert.jsp"%>
<%
	String id=request.getParameter("userid");
	String pwd=request.getParameter("pwd");
	//아이디 저장 체크박스에 체크한 값 받아오기
	String saveId=request.getParameter("saveId");
	
	
	if(id==null||pwd==null||"".equals(id.trim())||"".equals(pwd.trim())){
		response.sendRedirect("login.jsp");
		return;
	}
	
	/*
		UserDAO빈의 UserVO loginCheck(id,pwd) 호출
			1)아이디, 비번이 일치하는지 db에서 확인해서 일치하면
				해당 회원정보를 UserVO에 담아서 반환해 줌.
			2)일치하지 않으면 NotUserException.- 사용자 정의 예외를 발생시킨다.
	*/	
%>
<jsp:useBean id="userDao" class="user.persistence.UserDAO" scope="session"/>
<% 
	UserVO loginUser=userDao.loginCheck(id,pwd);
	if(loginUser!=null){
		//out.println("<h1>로그인 성공</h1>");
		session.setAttribute("loginUser", loginUser);
		
		java.util.Date d=new java.util.Date();
		java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyy_MM_dd hh:mm:ss");
		String time=sdf.format(d);
		session.setAttribute("loginTime", time);
		
		//[1] saveId에 체크한 경우 하지 않은 경우를 나눠서 처리하자
		// - 체크를 했다면 쿠키를 생성하고 해당 쿠키에 사용자 아이디를 저장한 뒤에 유효시간을 설정(7일간 유효)
		// - 체크하지 않았다면 쿠키를 삭제 처리
		Cookie ck=new Cookie("uid",loginUser.getUserid());//쿠키생성
		if(saveId!=null){//체크했다면
			//쿠키의 속성을 설정
			ck.setMaxAge(60*60*24*7);//7일간 유효
			
		}else{//체크하지 않았다면
			ck.setMaxAge(0);//쿠키 삭제
		}
		ck.setPath("/");
		//쿠키를 클라이언트 쪽에 밀어넣기
		response.addCookie(ck);
		
		
		response.sendRedirect("../index.jsp");
		/* 회원인증을 받았다면 인증받은 회원정보를 session에 저장하자.
			session 내장객체: HttpSession 타입
				- setAttribute(String key, Object value)
					:세션에 저장할 때 사용.
				- Object getAttribute(String key)
					:세션에 저장된 값을 꺼낼때 사용.
					
		
		*/
	}
	
%>