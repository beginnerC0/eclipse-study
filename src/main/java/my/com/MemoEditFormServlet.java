package my.com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MemoEditForm")
public class MemoEditFormServlet extends HttpServlet {

	@Override
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
		
		String idx=req.getParameter("idx");
		if(idx==null||idx.trim().isEmpty()) {
			res.sendRedirect("MemoList");
			return;
		}
		//MemoDAO생성해서 selectMemo(글번호)==> MemoVO객체를 받아서 해당 값을
		//메모 수정 폼에 보여준다.
		//out.println(idx);
		MemoDAO dao=new MemoDAO();
		MemoVO memo=dao.selectMemo(Integer.parseInt(idx.trim()));
		if(memo==null) {
			str="<script>";
			str+="alert('서버오류 입니다.')";
			str+="</script>";
			out.println(str);
			return;
		}
		
		out.println("<div class='container p-3'>");
		out.println("<form name='frm' action='MemoEdit' method='post'>");
		out.println("<input type='hidden' name='idx' value='"+idx+"'>");
		out.println("<table class='table'>");
		out.println("<tr><th colspan=\"2\"><h2 class='text-center'>::한줄 메모장 수정::</h2></th></tr>");
		out.println("<tr><td width=\"20%\"><b>작성자</b></td>");
		out.println("<td width=\"80%\"><input type=\"text\" name=\"name\" value='"+memo.getName()+"'  placeholder=\"Name\" class=\"form-control\"></td>");
		out.println("</tr><tr><td width=\"20%\"><b>메모 내용</b></td>");
		out.println("<td width=\"80%\"><input type=\"text\" name=\"msg\" value='"+memo.getMsg()+"'  placeholder=\"Message\" class=\"form-control\"></td></tr>");
		out.println("<tr><td colspan=\"2\" >");
		out.println("<a class='btn btn-primary' href='MemoList'>글 목 록</a>");
		out.println("<button type=\"submit\" class='btn btn-info' >글수정하기</button>");
		out.println("<button type=\"reset\" class='btn btn-warning'>다시쓰기</button></td></tr>");
		out.println("</table>");
		out.println("</form>");
		out.println("</div>");

	
		out.close();
	}
	
	

}
