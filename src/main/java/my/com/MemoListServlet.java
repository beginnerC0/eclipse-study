package my.com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;


@WebServlet("/MemoList")
public class MemoListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out=res.getWriter();
		
		String str="<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">\r\n"
				+ "    <!-- jQuery library -->\r\n"
				+ "    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js\"></script>\r\n"
				+ "    <!-- Popper JS -->\r\n"
				+ "    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js\"></script>\r\n"
				+ "    <!-- Latest compiled JavaScript -->\r\n"
				+ "    <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\"></script>\r\n"
				+ "    ";
		
		out.println(str);
		out.println("<div class='container'>");
		out.println("<h1 class='text-center text-primary m-5'>::한줄 메모장 목록</h1>");
		out.println("<table class='table table-striped'>");
		out.println("<tr class='tr-success'>");
		out.println("<th width='10%'>글번호</th>");
		out.println("<th width='50%'>글내용</th>");
		out.println("<th width='15%'>작성자</th>");
		out.println("<th width='15%'>작성일</th>");
		out.println("<th width='10%'>수정|삭제</th>");
		out.println("</tr>");
		//MemoDAO객체 생성해서 selectMemoAll()호출하기
		//==>반환값 ArrayList<MemoVO> 을 변수로 받아서 반복문 돌면서 해당 값을
		//td컬럼에 출력하기
		MemoDAO dao=new MemoDAO();
		ArrayList<MemoVO> arr=dao.selectMemoAll();
		if(arr==null) {
			str="<script>"
					+"alert('서버 오류입니다')"
					+ "</script>";
			out.println(str);
			return;
		}
		for(MemoVO m:arr) {
			out.println("<tr>");
			out.println("<td>"+m.getIdx()+"</td>");
			out.println("<td>"+m.getMsg()+"</td>");
			out.println("<td>"+m.getName()+"</td>");
			out.println("<td>"+m.getWdate()+"</td>");
			out.println("<td>");
			out.println("<a href='MemoEditForm?idx="+m.getIdx()+"'>수정</a>|");
			out.println("<a href='MemoDelete?idx="+m.getIdx()+"'>삭제</a>");
			out.println("</td>");
			out.println("</tr>");
		}//for--------------
		out.println("</table>");
		out.println("</div>");
		
		out.close();
	}
}








