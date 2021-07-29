<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*,com.oreilly.servlet.multipart.*,java.io.*" %>
<jsp:include page="/top.jsp"/>

   <h1 class="text-center text-secondary"> 라이브러리-cos.jar를 이용한 파일업로드 </h1>
   <h2>업로드할 디렉토리 : 서버의 /Myweb/upload</h2>
   <%--
   #라이브러리 다운로드
   [1] http://www.servlets.com/cos
   =>zip파일 다운로드 받아 압축풀면=>  cos.jar파일을 복사하여
   C:/Tomcat 8.5/lib 아래 붙여넣기 한다.
   
   [2] 업로드할 디렉토리 생성=>C:/MyJava/upload
   
   [3] 패키지 import :
   com.oreilly.servlet.*,com.oreilly.servlet.multipart.*
    --%>
<%
   //String upDir="C:/MyJava/Upload";
//업로드 할 디렉토리의 절대경로를 얻어보자.
// /MyWeb/Upload
//application 내장객체 : ServletContext타입의 getRealPath()메소드 사용
   String upDir=application.getRealPath("/Upload");
   out.println(upDir+"<br>");
   System.out.println(upDir);
   File dir = new File(upDir);
   if(!dir.exists()){
      dir.mkdirs();//디렉토리가 없다면 디렉토리 생성
   }
   MultipartRequest mr = null;
   try{
   DefaultFileRenamePolicy df = new DefaultFileRenamePolicy();
   //동일한 이름의 파일이 있을 경우 덮어쓰기를 방지하기 위해 파일 이름에 인덱스 번호를 붙여준다.
   
   mr= new MultipartRequest(request,upDir,1024*1024*10,"UTF-8", df); //최대용량 10메가바이트, 한글 깨짐방지
   //mr이 잘 생성되면 업로드 처리가 된 것임.
      out.println("<h2>업로드 성공</h2>");
   }catch(IOException e){
      e.printStackTrace();
      //파일 용량 초과 또는 enctype이 multipart/form-data가 아닐 때 에러 발생
      out.println("<h3>업로드 실패</h3>");
   }
   //1. 올린 사람 이름 얻어오기
   //String name = request.getParameter("name"); [x] ==> null값이다.
   String name = mr.getParameter("name");
      
   
   
   
   //2. 업로드한 파일명 얻어오기
   //String filename = mr.getParameter("filename"); [x] 
   String filename = mr.getFilesystemName("filename");//업로드한 파일의 물리적인 파일명을 반환한다. day011.sql
   
   String originFilename= mr.getOriginalFileName("filename");//원본파일명 : day01.sql
   
   
   //3. 업로드한 파일 크기 알아내기
   File file = mr.getFile("filename");
   long fsize=0;
   if(file != null){
      fsize=file.length();
   }
   
   
   
   //4. 업로드한 파일 컨텐트 타입 알아내기
   String ctype = mr.getContentType("filename");
   
   
%>

<h1>올린이 : <%=name %></h1>
<h1>첨부파일명 : <%=filename %></h1>
<h1>원본파일명 : <%=originFilename %></h1>
<h1>첨부파일 컨텐트타입 : <%=ctype %></h1>

<% if(ctype.equals("image/png")||ctype.equals("images/jpeg")){
   %>
   <%-- <img src="C:/MyJava/upload/<%=filename %>"> --%>
   <img src="<%=request.getContextPath()%>/Upload/<%=filename%>">
   <%
   
}

%>
<h2><a href="fileList.jsp">파일 목록 보러가기</a></h2>
<jsp:include page="/foot.jsp"/>



