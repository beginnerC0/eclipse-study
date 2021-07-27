package my.com;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*서블릿을 작성하면 서블릿을 등록해야 한다.   
 * (1) WEB-INF/web.xml 파일에 등록하는 방법
 * (2) Annotation으로 등록하는 방법=> @WebServlet
 * */
@WebServlet("/Get") //url-pattern은 해당 컨텍스트 내에서 unique해야 함

public class GetServlet extends HttpServlet{
	/*
	 * method방식이 get방식일 때는 doGet()을 오버라이드 해야 한다.
	 * [1] get방식은 사용자가 입력한 값들을 요청url에 쿼리스트링(query string)으로 포함시켜 전송한다
	 *     ...?파라미터명=값&파라미터명=값&파라미터명=값 ...
	 * [2] 비번,주민번호...등이 있을 때는 post방식으로 전송해야 한다.
	 * [3] get방식은 요청라인에 데이터를 포함시키기 때문에 적은양의 데이터만 전송가능..512byte정도
	 *     따라서 파일업로드 등이 필요하면 post방식을 사용해야 한다.    
	 * */
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res)
	throws ServletException,IOException{
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter pw=res.getWriter();
		//[1]사용자가 입력한 값을 받아보자.==> req객체를 이용해서 받는다.
		//String getParameter("인풋 네임")
		String id=req.getParameter("userid");
		String pwd=req.getParameter("pwd");
		
		//[2] 유효성 체크---
		if(id==null||pwd==null||id.trim().isEmpty()||pwd.trim().isEmpty()) {
			//제대로된 경로로 돌려보내자. hello.html통해서 들어오도록 한다.
			res.sendRedirect("hello.html");
			//hello.html로 페이지 이동을 한다. 이동을 해도 아래에 있는 로직을 계속 수행한다.
			//return문이 필요함
			return;
		}
		System.out.println("여기를 수행...");
		
		//[3]db에 연결해서 해당 회원이 맞는지 체크
		pw.println("<h1>Get Test</h1>");
		
		pw.println("<h2>아이디: "+id+"</h2>");
		pw.println("<h2>비밀번호: "+pwd+"</h2>");
		
		pw.close();
	}

}
