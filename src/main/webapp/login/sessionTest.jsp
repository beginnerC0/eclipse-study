<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp"/>
	<h1>session에 저장된 모든 정보를 꺼내보자</h1>
	<h2 class="text-danger">
	JSessionID: <%=session.getId() %>
	</h2>
	<%
		java.util.Enumeration<String> en=session.getAttributeNames();
		//세션에 저장된 key값들만 반환
		while(en.hasMoreElements()){
			String key=en.nextElement();
			Object val=session.getAttribute(key);
			
			out.println("<h2>"+key+": "+val+"</h2>");
		}
		
	%>
<jsp:include page="/foot.jsp"/>