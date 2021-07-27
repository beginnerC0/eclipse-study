<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*,java.util.*, java.text.*" %>
<jsp:include page="/top.jsp"  />

   <h1 class="text-center text-secondary m-3">업로드된 파일 목록</h1>
   
   <table class="table table-bordered table-condensed m-4">
      <tr>
         <th>FILE|DIR</th>
         <th>파일명</th>
         <th>파일크기</th>
         <th>마지막수정일</th>
         <th>다운로드</th>
      </tr>
      <!-- -------------------------- -->
      <%
         //Upload디렉토리의 절대경로 얻기
         String upDir=application.getRealPath("/Upload");
         File dir=new File(upDir);
         File[] fList= dir.listFiles();
         if(fList!=null){
            for(File file:fList){
               String fname=file.getName();
               String str=file.isFile()?"file.png":"dir.png";
               long fsize=file.length();
               long time=file.lastModified();
               Date d=new Date(time);
               String date=new SimpleDateFormat("yy-MM-dd hh:mm:ss").format(d);
      %>
            <tr>
               <td><img src="<%=request.getContextPath()%>/images/<%=str%>" width="24px"></td>
               <td><%=fname%></td>
               <td><%=fsize%>bytes</td>
               <td><%=date%></td>
               <td>
               <% if(file.isFile()){ %>
                     <a href="#" class="btn btn-outline-success" onclick="fileDown('<%=fname%>')">다운로드</a>
               <% }%>
               </td>
            </tr>
      <% 
            }//for---------
         }//if-------------
      %>
      <!-- -------------------------- -->
   </table>
   <script>
      function fileDown(fname){
         //alert(fname); //encodeURIComponent()함수를 통해 인코딩 처리를 해줘야 한글이 처리된다.
         location.href="../FileDown?filename="+encodeURIComponent(fname);
      }
   
   </script>   
    
<jsp:include page="/foot.jsp"  />


    