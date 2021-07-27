package my.com;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/Test")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		res.setContentType("text/html");
		//res:브라우저와 연결된 객체
		//브라우저에 보여줄 문서 형식을 html문서로 설정함
		
		PrintWriter out=res.getWriter();
		//브라우저와 연결된 출력스트림 얻어오기
		out.println("<html><body>");//html을 동적으로 생성해서 출력한다.
		
		out.println("<h1 style='color:green'>Hello Servlet</h1>");
		
		Date today=new Date();
		
		out.println("<h2 style='color:red'>"+today.toString()+"</h2>");
		
		
		out.println("</body></html>");
		out.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
