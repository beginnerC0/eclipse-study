<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ex10_request.jsp -->
<style>
	body{
		padding:3em;
	}
</style>

<form name="f" action="ex11_requestResult.jsp" method="get">
	<h1>request내장객체에 대해 알아봅시다.-HttpServletRequest타입</h1>
	<p>
		<label>이름</label>
		<input type="text" name="name">
	</p>
	<p>
		<label>아이디</label>
		<input type="text" name="id">
	</p>
	<p>
		<label>이메일</label>
		<input type="text" name="email">
	</p>
	<p>
		<label>취미</label>
		<input type="checkbox" name="hobby" value="music">음악감상
		<input type="checkbox" name="hobby" value="movie">영화감상
		<input type="checkbox" name="hobby" value="reading">독서
	</p>
	<p>
		<select name="job">
			<option value="Developer">개발자</option>
			<option value="Operator">운영자</option>
			<option value="Salesman">영업사원</option>
		</select>
	</p>
	<p>
		<select name="lang" multiple="multiple"> <!-- 다중 선택 가능 -->
			<option value="Java">Java</option>
			<option value="C">C</option>
			<option value="JavaScript">JavaScript</option>
		</select>
	</p>
	
	
	<button>회원가입</button>
	<button type="reset">다시쓰기</button>

</form>