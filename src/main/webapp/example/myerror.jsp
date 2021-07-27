<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>    
<%--  
에러 처리 페이지에서는 반드시 page지시어에 isErrorPage라는 속성 값으로 true를 주어야 한다.
true로 주면 exception내장 객체를 사용할 수 있다.
--%>  
<style>
	div#wrap{
		width:80%;
		margin:50px auto;
		padding:2em;
	}
	div.err{
		width: 80%;
		background-color:beige;
		color:red;
		height:250px;
		text-align:center;
		margin:auto;
		padding:1em;
	}

</style>  
<div id="wrap">
	<div class="err">
		<h1>Server Error : <%=exception.getMessage() %> </h1>
	
		<% 
			exception.printStackTrace();
			//디버그 용=> 톰캣 콘솔에 출력함		
		%>
	
		<p>
		<!-- href속성에 자바스크립트 코드를 넣어 동작시키려면
			앞에 javascript: 접두어를 붙여주어야 한다.
		 -->
			<a href="javascript:history.back()">[이전 페이지로 돌아가기1]</a>
			<a href="#" onclick="history.back()">[이전 페이지로 돌아가기2]</a>
			<button onclick="history.back()">이전 페이지로 가기</button>
		</p>
	</div>

</div>




