<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ex11_requestResult.jsp -->
<% 
	request.setCharacterEncoding("UTF-8");
	//사용자가 입력한 값을 받아 브라우저에 출력하기
	//=>request 내장객체를 이용. String getParameter("파라미터명")
	String name=request.getParameter("name");
	String id=request.getParameter("id");
	String email=request.getParameter("email");
	//[1] 단일 입력값일 경우 =>  String getParameter("파라미터명")를 이용해서 받는다.
	//[2] 다중 입력값일 경우 =>  String[] getParameterValues("파라미터명")을 이용
							//=> 사용자가 입력한 값을 배열로 반환
	
    //job, hobby, lang 값을 받아 브라우저에 출력하세요	
    String job=request.getParameter("job");
    String[] hobbies=request.getParameterValues("hobby");
    String[] langs = request.getParameterValues("lang");
	
	if(name==null){
		response.sendRedirect("ex10_request.jsp");
		return;
	}

%>
<h1>이름: <%=name %></h1>
<h1>아이디:<%=id %> </h1>
<h1>이메일:<%=email %> </h1>
<h1>직업:<%=job %></h1>
<h1>취미:
<% 
	if(hobbies!=null){
		for(String hobby:hobbies){
			out.println(hobby);
		}
	}
%>
</h1>
<h1>
사용언어:
<% 
	if(langs!=null){
		for(String lang:langs){
			out.println(lang);
		}
	}
%>
</h1>
<hr color='red'>
<h1>request객체의 주요 메소드</h1>
<% 
	String server=request.getServerName();//서버 도메인명
	int port=request.getServerPort();//포트번호
	
	StringBuffer buf=request.getRequestURL();
	//요청url정보를 반환
	String urlStr=buf.toString();
	//http://localhost:9090/MyWeb/example/ex11_requestResult.jsp
	
	String uri = request.getRequestURI();
	//컨텍스트명(/MyWeb) 이후의 경로를 반환한다.
	///MyWeb/example/ex11_requestResult.jsp
	
	String query=request.getQueryString();
	//name=aa&id=bb&email=cc&....
			
	//클라이언트 IP주소
	String cip=request.getRemoteAddr();
	String ctx=request.getContextPath();//컨텍스트명을 반환 "/MyWeb"
	String protocol=request.getProtocol();
	String serverPath=request.getServletPath();
%>
<h2>서버 도메인명: <%=server %> </h2>
<h2>서버 포트번호: <%=port %></h2>
<h2>요청 URL: <%=urlStr %></h2>
<h2>요청 URI: <%=uri%></h2>
<h2>query string: <%=query %></h2>
<h2>클의 ip: <%=cip %></h2>
<h2>프로토콜: <%= protocol%></h2>
<h2>서블릿경로:<%=serverPath %></h2>
<h2>컨텍스트명:<%=ctx %></h2>

<hr color="blue">
<h1>request의 Header정보를 추출해보자.</h1>
<% 
	java.util.Enumeration<String> en=request.getHeaderNames();
	while(en.hasMoreElements()){
		String headerName=en.nextElement();//key값
		String headerValue=request.getHeader(headerName);//value값
		out.println("<h3>"+headerName+": "+headerValue+"</h3>");
	}

%>
























