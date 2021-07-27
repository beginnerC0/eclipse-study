<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,java.text.*"%>
<jsp:include page="/top.jsp"  />

   <h1 class="text-center text-secondary">Cookie Test</h1>
   <%
   		//[1] 쿠키 생성 단계(key,value)
   		Cookie ck1= new Cookie("nick","Happy");
   		Date today=new Date();
   		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_hh:mm:ss");
   		String time=sdf.format(today);
   		Cookie ck2= new Cookie("visitTime",time);
   				//쿠키 저장할 값들은 영문만 가능. 공백문자, 세미콜론(;), 콤마(,), 특수문자 등은 포함되면 안된다.
   		//[2] 쿠키 속성 설정 단계(expiry, domain, path, secure...)
   		ck1.setMaxAge(3*24*60*60);//3일간 유효
   		ck2.setMaxAge(5*24*60*60);//5일간 유효
   		//쿠키 삭제를 원하면 setMaxAge(0)를 설정한다.
   		//유효시간이 지나면 쿠키는 자동으로 삭제된다.
   		
   		//[3] 쿠키 전송 단계
   		response.addCookie(ck1);
   		response.addCookie(ck2);
   		
   %>
   <h1>쿠키 저장 완료</h1>
   <h2><a href="cookieList.jsp">쿠키 목록 보러가기</a></h2>
<jsp:include page="/foot.jsp"  />
