<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ex12_responseResult.jsp 

id,pwd값 받아서 출력하기
-->
<%
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	out.println(id+"/"+pwd);
	
	//유효성 체크 id,pwd가 null이면 리다이렉트로 ex12_response.jsp로 이동하세요
	if(id==null||pwd==null){
		request.setAttribute("msg", "아이디,비번이 널이에요");
		
		response.sendRedirect("ex12_response.jsp");
		/* ex12_response.jsp 페이지로 이동한다
		=> redirect방식으로 이동한다.
		   브라우저의 요청url을 ex12_response.jsp로 바꿔서 새롭게 서버에 요청을 보내는 방식으로 이동한다.
		   -> 따라서 처음 보냈던 request와 redirect로 이동시 사용한 request는 서로 다른 request다.
		*/
		/************************************
		sendRedirect()를 이용해 redirect방식으로 페이지를 이동하면
		[1] 페이지 이동이 일어난다.
		[2] 이 때 새로운 페이지로 서버에 새롭게 요청(request)을 보내어 응답받는 형태가 된다.
		[3] 따라서 브라우저의 요청 url은 새롭게 이동한 페이지의 url로 바뀌어 있다.
		[4] 이동시킨 페이지와 이동한 페이지는 서로 다른 request이므로 request에 저장된 값을
			기억하지 못한다.
		*************************************/		
		return;
	}
	if(id.equals("forward")){
		//foward방식으로 이동해보자.
		request.setAttribute("msg", "forward방식으로 이동했어요");
		/******************************************** 
		  forward방식의 이동
		  [1] 서버 내부에서 페이지 이동이 일어난다.
		  [2] 따라서 서버 내부에서 이동하므로 브라우저의 요청url은 이전 url을 유지한다.
		  [3] 이동시킨 페이지와 이동한 페이지가 같은 request를 공유한다.
		  [4] 따라서 request에 저장한 값이 있으면 이동된 페이지에서 이를 꺼내 사용할 수 있다.
		*******************************************/
		%>
		<jsp:forward  page="ex12_response.jsp"/>
		<%
	}
	else if(id.equals("")){
		//빈문자열인 경우는 에러를 출력해보자.(잘못된 요청이라는 에러를 출력하자)
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);//400
		return;
	}else if(id.equals("killer")){
		response.sendError(response.SC_FORBIDDEN);//403
		return;
	}
%>
<h1 style='color:blue'><%=id %>님 환영합니다~~</h1>





