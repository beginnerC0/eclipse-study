package my.com;

import javax.servlet.*; //servlet-api.jar
import javax.servlet.http.*;
import java.io.*;
//Servlet: Server Side Applet
//Servlet Container(WAS)에서 실행되는 웹 애플리케이션
//HttpServlet클래스를 상속받아야 함
//get방식 요청==> doGet()메소드를 오버라이드 해야 함
//post방식 요청 ==> doPost()메소드를 오버라이드 해야 함
//서블릿을 실행시키시 위해서는
//[1] MyWeb/WEB-INF/web.xml에 해당 서블릿을 등록을 해주던지
/*
 <!-- 서블릿 등록 ====================== -->
  <servlet>
  	<servlet-name>HelloServlet</servlet-name>
  	<servlet-class>my.com.HelloServlet</servlet-class>
  </servlet> 
  <servlet-mapping>
  	<servlet-name>HelloServlet</servlet-name>
  	<url-pattern>/Hello</url-pattern>
  </servlet-mapping>
  
 */


//[2] @WebServlet()이라는 어노테이션을 붙여주던지 해야 한다.

public class HelloServlet extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res)
	throws IOException,ServletException{
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter pw=res.getWriter();
		pw.println("<html><body>");
		pw.println("<h1>Hello Servlet</h1>");
		pw.println("<h2>안녕 서블릿</h1>");
		pw.println("</body></html>");
		pw.close();
	}

}
