<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="java.util.*, user.domain.*,java.net.*" %>

<!-- 관리자 여부 체크 모듈 include----------------------- -->
<%@ include file="/login/adminCheckModule.jsp" %>
<!-- ----------------------------------------------- -->
<jsp:include page="/top.jsp"/>
<%-- UserDAO빈 객체 생성해서 ==> useBean액션 사용 
listUser() 호출한 뒤에 받아온 List를 반복문 돌면서 출력 --%>
<jsp:useBean id="userDao" class="user.persistence.UserDAO" scope="session"/>
<style>
   .txt0{
      color:blue;
   }
   .txt1{
      color:orange;
   }
   .txt-1{
      color:red;
   }
</style>
<%
   //검색유형과 검색어 받기
   String findType=request.getParameter("findType");
   String findKeyword=request.getParameter("findKeyword");
   if(findType==null||findKeyword==null||findType.trim().isEmpty()){
      %>
      <script>
         alert('검색유형을 선택하세요');
         location.href='list.jsp';
      </script>
      <%
      return;
   }

   //현재 보여줄 페이지 번호를 받자.
   String cpStr=request.getParameter("cpage");
   if(cpStr==null||cpStr.trim().isEmpty()){
      cpStr="1";//파라미터가 없다면 1페이지를 기본값으로 지정
   }
   int cpage=Integer.parseInt(cpStr.trim());
   if(cpage<1){
      cpage=1;
   }
   ////////////////////////////////////////////////////////////////
   //검색한 총 회원수 가져오기
   int totalCount=userDao.getTotalUser(findType, findKeyword); 
   ////////////////////////////////////////////////////////////////
   
   int pageSize=10;//한 페이지 당 보여줄 목록 개수를 10개로 정하자
   
   int pageCount=1;
   /*
   if(totalCount%pageSize==0){ //10명, 20명, 30명,....
      pageCount=totalCount/pageSize;
   }else{//1명,2,...9명, 11명....19명,...
      pageCount=totalCount/pageSize +1;
   }
   */
    pageCount=(totalCount-1)/pageSize+1;
   
   if(cpage>pageCount){
      cpage=pageCount;//마지막 페이지로 설정
   }
   //DB에서 데이터를 10개단위로 끊어오기 위한 변수 값 연산
   int end=cpage * pageSize;
   //int start = end - (pageSize-1);
   int start= end- pageSize +1;
 
   ///////////////////////////////////////////////////////////
   List<UserVO> userList = userDao.findUser(findType, findKeyword,start, end);
   ///////////////////////////////////////////////////////////
   
if(userList==null){ 
   %>
   <script>
      alert("서버오류입니다.");
      location.href="..index.jsp";
   </script>
   <%
   return;
}
%>
<h1 class="text-center m-3">[검색어: <%=findKeyword %>  ] 회원검색 결과-[Admin Page]</h1>
<div class="row m-5">
<div class="col-md-10 offset-md-1 text-center">
<!--  검색폼---------------------------- -->
<form name="findF" action="find.jsp" class="form-inline">
   <select name="findType" class="form-control mr-2">
      <option value="">::검색 유형::</option>
      <option value="1">회원이름</option>
      <option value="2">아이디</option>
      <option value="3">연락처</option>
   </select>
   <input type="text" name="findKeyword" placeholder="검색어를 입력하세요"
    class="form-control mr-2">
   <button class="btn btn-success">검  색</button>
</form>
<!--  ------------------------------- -->
</div>
</div>

<table class="table table-striped"> 
   <tr>
      <th>번호</th>
      <th>이름</th>
      <th>아이디</th>
      <th>연락처</th>
      <th>회원상태</th>
      <th>수정|삭제</th>
   </tr>

<!-- ------------------------------------ -->
<%

if(userList.size() ==0){
   %>
   <tr>
      <td colspan="6">
         <b>데이터가 없습니다.</b>
      </td>
   </tr>
   <%
}else{
   
   for(UserVO user:userList){
      
      String str=(user.getMstate()==0)?"일반회원":(user.getMstate()==1)?"정지회원":"탈퇴회원";
      
   %>   
   <tr>
      <td><%=user.getIdx()%></td>
      <td><%=user.getName()%></td>
      <td><%=user.getUserid()%></td>
      <td><%=user.getAllHp()%></td>
      <td class="txt<%=user.getMstate()%>"><%=str%></td>
      <td><a href="edit.jsp?idx=<%=user.getIdx()%>">수정</a>
      |<a href="delete.jsp?idx=<%=user.getIdx()%>">삭제</a></td>
   </tr>
   <% 
   }// for

}//else
%>
<!-- ----페이지 네비게이션-------------------------------- -->
<% 
   //IE의 경우 쿼리스트링 파라미터에 한글이 들어갈 경우 UTF-8로 인코딩 처리 해야 한다.
   //==> java.net.URLEncoder.encode(str, encode)메소드 활용
   String params="&findType="+findType+"&findKeyword="+URLEncoder.encode(findKeyword,"UTF-8");
%>
   <tr>
      <td colspan="4" class="text-center">
        <ul class="pagination justify-content-center">
        
        <li class="page-item">
           <a class="page-link" href="find.jsp?cpage=<%=cpage-1%><%=params%>">Prev</a>
        </li>
         <%
         
         for(int i=1;i<=pageCount;i++){
            String str=(cpage==i)?"active":"";   
         %>
         <li class="page-item <%=str%>">
        <a class="page-link" href="find.jsp?cpage=<%=i%><%=params%>"><%=i%></a>
         </li>
        <%--     [<a href="list.jsp?cpage=<%=i%>"><%=i%></a>] --%>
         <% 
         }
         %>
         
        <li class="page-item">
           <a class="page-link" href="find.jsp?cpage=<%=cpage+1%><%=params%>">Next</a>
        </li>
        
       </ul>  
      </td>
      <td colspan="2" class="text-right pr-3">
      <b>총회원수</b>:<span class="text-primary"><%=totalCount%>명</span>
      </td>
   </tr>
   
   
</table>

<jsp:include page="/foot.jsp"/>
