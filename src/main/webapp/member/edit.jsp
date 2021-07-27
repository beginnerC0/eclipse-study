<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.domain.*"  %>
    
<%@ include file="/login/loginCheckModule.jsp" %>

<%
	String idx=request.getParameter("idx");
	String mode=request.getParameter("mode");
	
	//out.println(idx);
	if(idx==null||idx.trim().isEmpty()){
		idx=String.valueOf(member.getIdx());//로그인한 회원의 회원번호를 할당
		if(idx==null){		
			response.sendRedirect("list.jsp");
			return;
		}
	}
	if(mode!=null && mode.equals("1")){
		session.setAttribute("mode", "1");
	}
	//회원번호로 회원정보 가져오기
%>
<jsp:useBean id="userDao"  class="user.persistence.UserDAO" scope="session" />


<jsp:include page="/top.jsp" />

<script>
	let win=null;
	let zip=null;
	let openWin=function(){
		win=window.open("idCheck.jsp","idCheck",
				"width=400, height=400, left=100, top=100");
	}
	
	let openZip=function(){
		zip=window.open("zipCheck.jsp","idCheck",
		"width=400, height=400, left=100, top=100");
	}

	let check=function(){
		if(!f.name.value){
			alert('이름을 입력하세요');
			f.name.focus();
			return;
		}
		
		if(!f.userid.value){
			alert('아이디를 입력하세요');
			f.userid.focus();
			return;
		}
		//비번 체크
		if(!f.pwd.value){
			alert('비밀번호를 입력하세요');
			f.pwd.focus();
			return;
		}
		//비번과 비번확인이 동일한지 여부 체크
		if(f.pwd.value != f.pwd2.value){
			alert('비밀번호와 비밀번호 확인값이 달라요');
			f.pwd2.select();
			return;
		}
		
		//연락처 입력 체크
		if(!f.hp1.value || !f.hp2.value || !f.hp3.value){
			alert('연락처를 모두 입력하세요');
			f.hp1.focus();
			return;
		}
		
		f.submit();		
		
	}//check()-----------------

</script>
<% 

	UserVO user=userDao.selectUser(idx);
	if(user==null){
		%>
		<script>
			alert('존재하지 않는 회원입니다.');
			history.back();
		</script>
		<%
		return;
	}
%>

<div class="container">
	<h1 class="text-center text-primary m-4">User Info Edit Form</h1>
	<form name="f" action="editEnd.jsp" method="post">
		
		<!-- ------------------------------------------ -->
		<input type="hidden" name="idx" value="<%=idx%>">
		<!-- hidden data-------------------------------  -->
		
		<table class="table">
			<tr>
				<td width="20%">
				<b>이름</b>
				</td>
				<td width="80%">
				<input type="text" name="name" value="<%=user.getName()%>"  placeholder="Name"
				 class="form-control">
				</td>
			</tr>
			<tr>
				<td width="20%">
				<b>아이디</b>
				</td>
				<td width="80%">
				<div class="row">
					<div class="col-md-8">
					<input type="text" name="userid"  value="<%=user.getUserid()%>" 
					 placeholder="User ID"
						readonly
					 class="form-control" >
					 </div>
					 <div class="col-md-4">
					 <button type="button" onclick="openWin()" class="btn btn-primary">아이디 중복 체크</button>
					 </div>
				 </div>
				</td>
			</tr>
			
			<tr>
				<td width="20%">
				<b>비밀번호</b>
				</td>
				<td width="80%">
				<input type="text" name="pwd" placeholder="Password"
				 class="form-control">
				</td>
			</tr>
			
			<tr>
				<td width="20%">
				<b>비밀번호 확인</b>
				</td>
				<td width="80%">
				<input type="text" name="pwd2" placeholder="Re Password"
				 class="form-control">
				</td>
			</tr>
			<tr>
				<td width="20%">
				<b>연락처</b>
				</td>
				<td width="80%">
				<div class="row">
					<div class="col-md-3">
				<input type="text" name="hp1" value="<%=user.getHp1() %>" maxlength="3"
				 placeholder="HP1"	 class="form-control">
					</div>
					<div class="col-md-3">
				<input type="text" name="hp2"  value="<%=user.getHp2()%>"   maxlength="4" 
				placeholder="HP2"	 class="form-control">
					</div>
					<div class="col-md-3">
				<input type="text" name="hp3" value="<%=user.getHp3()%>" maxlength="4"
				 placeholder="HP3"	 class="form-control">
					</div>
				 </div>
				 <!-- row end -->
				</td>
			</tr>
			<tr>
				<td width="20%">
				<b>우편번호</b>
				</td>
				<td width="80%">
				<div class="row">
					<div class="col-md-8">
					<input type="text" name="zipcode" readonly
					  value="<%=user.getZipcode()%>"  placeholder="Zipcode"
						maxlength="5"
					 class="form-control">
					 </div>
					 <div class="col-md-4">
					 <button type="button" onclick="openZip()" class="btn btn-primary">우편번호 확인</button>
					 </div>				 
				 </div>
				</td>
			</tr>
			<tr>
				<td width="20%">
				<b>주소</b>
				</td>
				<td width="80%">
			<input type="text" name="addr1" value="<%=user.getAddr1()%>" readonly
			 placeholder="Address1" class="form-control mb-1">
			<input type="text" name="addr2"  
			 placeholder="Address2"  value="<%=user.getAddr2()%>"  class="form-control">
				</td>
			</tr>
			
			<tr>
				<td width="20%">
				<b>마일리지</b>
				</td>
				<td width="80%">
				<input type="text" name="mileage" readonly value="<%=user.getMileage()%>"  placeholder="Name"
				 class="form-control">
				</td>
			</tr>
			<tr>
				<td width="20%">
				<b>회원상태</b>
				</td>
				<td width="80%">
				<% 
			String str=(user.getMstate()==0)?"일반회원":(user.getMstate()==1)?"정지회원":"탈퇴회원";
					out.println("<b>"+str+"</b>");
					
					
				%>
				<input type="radio" name="mstate" 
				value="0"  placeholder="Name" <%=(user.getMstate()==0)?"checked":"" %>
				>일반회원
				
				<input type="radio" name="mstate" <%=(user.getMstate()==1)?"checked":"" %>
				value="1"  placeholder="Name"
				>정지회원 
				 
				<input type="radio" name="mstate" <%=(user.getMstate()==-1)?"checked":"" %>
				value="-1"  placeholder="Name"
				>탈퇴회원 
				 
				</td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<button type="button" onclick="check()"
					class="btn btn-success">수정하기</button>
					<button type="reset" class="btn btn-danger">다시쓰기</button>
				</td>
			</tr>
		</table>
	</form>
</div>
<jsp:include page="/foot.jsp" />