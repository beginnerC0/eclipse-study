package my.com;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdbc.util.*;
import java.sql.*;

@WebServlet("/MemoAdd") //url-pattern (논리적 경로)
public class MemoAddServlet extends HttpServlet{
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res)
	throws ServletException,IOException{
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out=res.getWriter();
		
		String name=req.getParameter("name");
		String msg=req.getParameter("msg");
		
		if(name==null||msg==null||name.trim().isEmpty()||msg.trim().isEmpty()) {
			res.sendRedirect("memo/index.html");
			return;
		}
		
		//name,msg값을 MemoVO객체 생성해서 담아주기.
		MemoVO memo=new MemoVO(0,name,msg, null);
	
		//MemoDAO객체 생성해서
		MemoDAO dao=new MemoDAO();
		//insertMemo(vo객체)호출하기
		boolean b=dao.insertMemo(memo);
		
		//=> true면 브라우저에 "입력 성공", false=> "입력 실패" 출력하기
		String str=(b)?"글 등록 성공":"글 등록 실패";
		String loc=(b)?"MemoList":"memo/index.html";
		
		//out.println(str);
		out.println("<script>");
		out.println("alert('"+str+"')");
		out.println("location.href='"+loc+"'");		
		out.println("</script>");
		out.close();
	}

	
	
	
	
	
	
}
