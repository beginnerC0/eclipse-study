<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp"  />

	<h1 class="text-center text-secondary">파일 업로드 결과</h1>
	<h2>전송되는 데이터 형태를 브라우저 화면에 그대로 출력해봅시다.</h2>
	<hr color="red">
	<% 
		//컨텐트 타입과 파일크기를 알아보자
		String ctype=request.getContentType();
		int len=request.getContentLength();//첨부파일 크기
		//long len2=request.getContentLengthLong();
		
	%>
	<h3>ContentType:<%=ctype %> </h3>
	<h3>ContentLength:<%=len %> </h3>
	<hr color="blue">
	<% 
		//request의 body에 포함되어 오는 파일 데이터를 스트림 연결해서 읽어들인 후
		//브라우저에 출력해보자.
		ServletInputStream in=request.getInputStream();
		byte[] data=new byte[1024];	
		int n=0, count=0;
		out.println("<xmp>"); //소스보기 태그
		while((n=in.read(data))!=-1){
			String str=new String(data, 0,n);
			out.println(str);
			count+=n;
		}
		out.println("</xmp>");
		out.println("<h2>파일 크기: "+count+"bytes</h2>");
		in.close();
	%>
    
<jsp:include page="/foot.jsp"  />    




