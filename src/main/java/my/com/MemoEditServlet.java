package my.com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/MemoEdit")
public class MemoEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out=res.getWriter();
		//post방식일 때 한글 처리---
		req.setCharacterEncoding("UTF-8");
		
		String idx=req.getParameter("idx");
		String name=req.getParameter("name");
		String msg=req.getParameter("msg");
		if(idx==null||name==null||idx.trim().isEmpty()||name.trim().isEmpty()) {
			res.sendRedirect("MemoList");
			return;
		}
		
		MemoVO memo=new MemoVO(Integer.parseInt(idx),name,msg, null);
		
		MemoDAO dao=new MemoDAO();
		
		boolean b=dao.updateMemo(memo);
		
		String str=(b)? "수정 처리 완료":"수정 실패";
		String loc=(b)? "MemoList":"MemoEditForm?idx="+idx;
		
		out.println("<script>");
		out.println("alert('"+str+"')");
		out.println("location.href='"+loc+"'");
		out.println("</script>");
		
		
		out.close();
	}

}




