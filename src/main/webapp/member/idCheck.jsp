<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="user.persistence.*"  %>
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
	<form class="form-inline" action="idCheck.jsp" method="post"
	 onsubmit="return id_check()">
		<label for="userid">아이디</label>
		<input type="text" name="userid" id="userid" autofocus="autofocus"
		placeholder="User ID" class="form-control">	
		<button class="btn btn-outline-primary">확  인</button>
	</form>
</div>

<% }else{
	//post방식일 경우 "아이디 사용 가능 여부"를 알려준다.
	//사용자가 입력한 아이디값 받기
	String userid=request.getParameter("userid");
%>
	<%-- <jsp:useBean id="conPool" class="common.pool.ConnectionPoolBean" scope="application" /> --%>

	<jsp:useBean id="userDao" class="user.persistence.UserDAO" scope="session" />
	<%-- <jsp:setProperty name="userDao" property="pool" value="<%=conPool %>" /> --%>
<% 
	//ConnectionPoolBean conPool=new ConnectionPoolBean();
	//UserDAO dao=new UserDAO();
	//dao.setPool(conPool); 와 동일함
	
	//사용가능 여부 체크
	boolean isUse=userDao.idCheck(userid); 
	
	if(isUse){
	
%>
<div class="container">
	<div class="alert alert-success text-center" style="height:250px">
		<h3><%=userid %>를 사용할 수 있습니다.</h3>
		<button class="btn btn-success" onclick="setId('<%=userid%>')">닫 기</button>
	</div>
</div>
<% }else{ %>
<div class="container">
<div class="row">
	<div class="col-md-10 offset-md-1">
		<div class="alert alert-danger">
			<h3><%=userid %>는 이미 사용 중 입니다.</h3>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-10 offset-md-1">
		<form class="form-inline" action="idCheck.jsp" method="post"
		 onsubmit="return id_check()" >
		<label for="userid">아이디</label>
		<input type="text" name="userid" id="userid" autofocus="autofocus"
		placeholder="User ID" class="form-control">	
		<button class="btn btn-outline-primary">확  인</button>
	</form>
	</div>
</div>	
</div>
<!-- . container end -->
<%} %>	
<%
	}
	 %>
<script>
	function id_check(){
		let val=$('#userid').val();
		if(!val){
			alert('아이디를 입력하세요');
			$('#userid').focus();
			return false;
		}
		let pttrn=/^[a-zA-Z]{1}[\w_!]{3,7}$/
		if(!pttrn.test(val)){
			alert('아이디 형식에 맞지 않아요(영문자,숫자,!,_로 4~8자 이내)');
			$('#userid').select();
			return false;
		}
		return true;
	}//-------------------------------

	function setId(uid){
		//alert(uid);
		//uid값을 부모창(join.jsp)의 userid의 value값으로 전달한다.
		//부모창 (opener==> window객체)
		//[window > document > form]
		opener.document.f.userid.value=uid;
		//팝업창 닫기 (자기창==>self ==>window객체)
		self.close();
	}

</script>



