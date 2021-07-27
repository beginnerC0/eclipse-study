<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/top.jsp"/>

	<script>
		function loginCheck(){
			//아이디 입력 체크
			if(!loginF.userid.value){
				alert('아이디를 입력하세요');
				loginF.userid.focus();
				return false;
			}
			
			//비번 입력 체크
			if(!loginF.pwd.value){
				alert('비밀번호를 입력하세요');
				loginF.pwd.focus();
				return false;
			}
			return true;
		}
	</script>
	<%
		//쿠키를 꺼내서 사용자 아이디가 저장되어 있으면 아이디 입력 폼에 출력해주기
		Cookie[] cks=request.getCookies();
		String uid="";
		boolean flag=false;
		if(cks!=null){
			for(Cookie ck: cks){
				String key=ck.getName();//쿠키의 키값 반환
				if(key.equals("uid")){
					flag=true;
					uid=ck.getValue();//사용자 아이디
					break;
				}
			}
		}
	%>
    
    <h1 class="text-center m-4 text-secondary">Login Page</h1>
    <div class="row">
    	<div class="col-md-8 offset-md-2">
    		<form name="loginF" action="loginEnd.jsp" method="post"
    		 onsubmit="return loginCheck()">
    			<table class="table table-bordered">
    				<tr>
    					<th>아이디</th>
    					<td>
    					<input type="text" name="userid" value="<%=uid %>"
    					  class="form-control" autofocus="autofocus"
    					 placeholder="ID">
    					</td>
    				</tr>
    				
    				<tr>
    					<th>비밀번호</th>
    					<td>
    					<input type="password" name="pwd"
    					  class="form-control"
    					 placeholder="Password">
    					</td>
    				</tr>
    				
    				<tr>
    					<td colspan="2" class="text-right">
    						<label for="saveId" class="form-check">
    							<input type="checkbox" <%=(flag)?"checked":"" %> name="saveId" id="saveId"> 아이디 저장
    						</label>
    					</td>
    				
    				</tr>
    				
    				<tr>
    					<td colspan="2" class="text-center">
    						<button class="btn btn-primary">Login</button>
    						<button type="reset"
    						 class="btn btn-danger">Reset</button>
    					</td>
    				</tr>
    			
    			</table>    		    		
    		</form>    		
    	
    	</div>    
    </div>
    
<jsp:include page="/foot.jsp"/>    