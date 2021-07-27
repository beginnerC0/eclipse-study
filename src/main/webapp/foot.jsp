<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String myctx=request.getContextPath();
	
%>
    </div>
		<div class="col-md-3">
			<ul class="list-group">
				<li class="list-group-item"><a href="<%=myctx%>/beans/input.jsp">beans1</a></li>
				<li class="list-group-item"><a href="<%=myctx%>/beans/input2.jsp">beans2</a></li>
				<li class="list-group-item"><a href="<%=myctx%>/login/sessionTest.jsp">session테스트</a></li>
				<li class="list-group-item"><a href="<%=myctx%>/login/memberTest.jsp">회원인증 페이지</a></li>
				<li class="list-group-item"><a href="<%=myctx%>/cookie/cookieTest.jsp">cookie테스트</a></li>
				<li class="list-group-item"><a href="<%=myctx%>/file/upload.jsp">파일업로드1</a></li>
				<li class="list-group-item"><a href="<%=myctx%>/file/upload2.jsp">파일업로드2</a></li>
				<li class="list-group-item"><a href="<%=myctx%>/file/fileList.jsp">업로드 파일목록</a></li>
				<li class="list-group-item"><a href="<%=myctx%>/dbcp/dbcpTest.jsp">DBCP테스트</a></li>
				
			</ul>
		</div>
	</div> <!-- .row end -->
	
</div>
<!-- -------------------------------------- -->

<!-- footer ------------------------------ -->
<div class="jumbotron text-center" style="margin-bottom:0">
	<p>Footer @Copyright  연락처:02-1111-3333</p>
</div>
<!-- -------------------------------------- -->
</body>
</html>
    