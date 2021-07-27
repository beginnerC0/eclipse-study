<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>ex04.jsp</h1>

<%
	//scriptlet태그 안에서 변수를 선언하면 => 지역변수가 된다.
	//스크립트렛 태그 안에 작성된 코드들은 서블릿의 __jspService()메소드 안에 들어간다.
	String str="Hello(지역변수)";

%>
<h2><%=str %></h2>

<%!
//declaration : 선언문
//여기에서는 멤버변수를 선언하거나 사용자 정의 메소드를 구성할 수 있다.
	String global="Global(멤버변수)";

	public String sum(int a, int b){
		int c=a+b;
		
		return a+"+"+b+"="+c;
	}

%>
<h2><%=global%></h2>
<hr color='red'>
<h1><%=sum(77,22)%></h1>



