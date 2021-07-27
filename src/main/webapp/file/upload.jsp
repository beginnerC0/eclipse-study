<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp"  />

	<h1 class="text-center text-secondary">파일 업로드1</h1>
	<%-- 
		#파일 업로드시 주의 사항
		[1] 파일을 업로드 하려면 form의 method는 반드시 post로 주어야 한다.
		[2] post방식일 경우 인코딩방식(enctype)이 2가지가 있는데
			(1) application/x-www-form-urlencoded (디폴트)
				=> 이 경우는 첨부 파일의 이름만 서버에 전송된다.
			(2) multipart/form-data
				=> 파일 이름과 함께 파일 데이터가 서버에 전송된다.
	--%>
	<form name="fileF"  action="uploadEnd.jsp" method="post" enctype="multipart/form-data">
		<div class="row">
			<div class="col-md-12">
			<table class="table table-bordered" border="1">
				<tr>
					<td>올린이</td>
					<td>
					<input type="text" name="name"
					 id="name" placeholder="글쓴이" class="form-control">
					</td>
				</tr>
				<tr>
					<td>첨부파일1</td>
					<td>
					<input type="file" name="filename"
					 id="filename" class="form-control">
					</td>
				</tr>
				<tr>
					<td colspan="2">					
						<button type="submit" id="btnUp"
						 class="btn btn-success ml-3">업로드</button>
					</td>
				</tr>
			</table>
			</div>		
		</div>
	
	</form>
    
<jsp:include page="/foot.jsp"  />    