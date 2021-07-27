<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/example/myerror.jsp"%>
    
<%@ page import="user.persistence.*, user.domain.*" %>
    
<%-- 회원가입 로직을 처리하는 페이지 --%>
<%
//1. post방식일 때 한글 처리
	request.setCharacterEncoding("UTF-8");

//2. 사용자가 입력한 값 받기 (이름, 아이디,비번, 연락처,우편번호,주소)
	String name=request.getParameter("name");
	String userid=request.getParameter("userid");
	String pwd=request.getParameter("pwd");
	String hp1=request.getParameter("hp1");
	String hp2=request.getParameter("hp2");
	String hp3=request.getParameter("hp3");
	String zipcode=request.getParameter("zipcode");
	String addr1=request.getParameter("addr1");
	String addr2=request.getParameter("addr2");

//3. 유효성 체크 (이름, 아이디,비번, 연락처)
	if(name==null||userid==null||pwd==null||hp1==null||hp2==null||hp3==null){
		response.sendRedirect("join.jsp");
		return;
	}
	if(name.trim().isEmpty()||userid.trim().isEmpty()){
		%>
		<script>
			alert('이름, 아이디, 비밀번호, 연락처는 필수 입력사항 입니다');
			history.back();
		</script>
		<%
		return;
	}

//4. UserVO 객체 생성해서 2에서 받은 값 넣어주기
	UserVO user
	=new UserVO(0,name,userid, pwd, hp1, hp2,hp3, zipcode,addr1, addr2, null, 1000,0);

//5. UserDAO객체 생성해서 createUser()호출하기
	UserDAO dao=new UserDAO();

	int n=dao.createUser(user);

//6. 그 결과 값을 받아서 브라0우저에 출력해보기
	//out.println(n);
	String msg=(n>0)? "회원가입 처리 완료":"회원가입 실패";
	String loc=(n>0)? "../login/login.jsp":"javascript:history.back()";
%>
<script>
	alert('<%=msg%>');
	location.href='<%=loc%>';
</script>





