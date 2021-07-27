package my.com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Post")
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out=res.getWriter();
		
		out.println("<h1>Post Test</h1>");
		//post방식일 때 한글 인코딩 처리
		req.setCharacterEncoding("UTF-8");
		
		//사용자가 입력한 값 받기
		String id=req.getParameter("userid");
		String pwd=req.getParameter("pwd");
		
		out.println("<h2>id: "+id+"</h2>");
		out.println("<h2>passwordd: "+pwd+"</h2>");
		out.println("<h1>한글</h1>");
		
		out.close();
	}

}
