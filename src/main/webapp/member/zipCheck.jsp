<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.persistence.*,user.domain.*,java.util.*"%>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
<%

	//요청방식을 알아보자.
	String method=request.getMethod();
	//out.println("method="+method);

	//요청방식이 get방식일 경우에는 ID입력 폼을 보여주고,
	// post방식일 때는 아이디 사용 가능 여부를 보여줄 예정
	if(method.equalsIgnoreCase("get")){
%>

<div class="container">
	<form class="form-inline" action="zipCheck.jsp" method="post">
		<label for="userid">도로명</label>
		<input type="text" name="zipcode" id="zipcode" autofocus="autofocus"
		placeholder="도로명 주소" class="form-control">	
		<button class="btn btn-outline-primary">검  색</button>
	</form>
</div>
<% }else{
	
	request.setCharacterEncoding("UTF-8");
	String zipcode=request.getParameter("zipcode");
	List<UserVO> userZip;
	if(zipcode==null){
		return;
	}else{
		String[] code=zipcode.split(" ");
		
		if(code.length>1){
			zipcode=code[0]+code[1];		
		}
	
		UserDAO dao=new UserDAO();
		 
		userZip=dao.zipCheck(zipcode); 
	}	
	if(userZip!=null){	
%>
	<div class="container">
	<form class="form-inline" action="zipCheck.jsp" method="post">
		<label for="userid">도로명</label>
		<input type="text" name="zipcode" id="zipcode" autofocus="autofocus"
		placeholder="도로명 주소" class="form-control">	
		<button class="btn btn-outline-primary">검  색</button>
	</form>
	</div>
	<div class="container">
	<form class="form-inline" method="post" name="fz">
	<div style="width:100%;height:150px;overflow:scroll">
	<table>
	<%for(UserVO user:userZip){%>
	<tr>
		<td><label><input type="radio" name="pro" value="<%=user.getZipcode()%>_<%=user.getAddr1()%>"><%=user.getZipcode()%> <%=user.getAddr1() %></label></td>
	
	</tr>
	<%}%>
	</table>
	</div>
	<button id='ch' class="btn btn-outline-primary">확  인</button>
	
	</form>
	</div>
	<% 
	
	}//if------
	
}//else-------%>
<script>
	$(function(){
		$('#ch').click(function(){
			if($('input[name="pro"]:checked').length<1){
				self.close();
			}
			let str=$('input[name="pro"]:checked').val();
			let token=str.split('_');			
			opener.document.f.zipcode.value=token[0];
			opener.document.f.addr1.value=token[1];
			self.close();
		})
	})
</script>

