package common.file;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/FileDown")
public class FileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		download(request,response);
	}

	
	private void download(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//1. 다운로드 받을 파일명 받기
		String fname=req.getParameter("filename");
		System.out.println("fname=="+fname);
		//2. 다운로드 받을 파일의 절대경로 만들기(application내장객체=> ServletContext타입)
		ServletContext app=req.getServletContext();
		String upDir=app.getRealPath("/Upload");
		
		String path=upDir+File.separator+fname;
		System.out.println("path= "+path);
		
		//3. 클라이언트 쪽에 다운로드 창을 보여주자.
		//res.setContentType("unknown");
		res.setContentType("application/octet-stream");
		//브라우저는 컨텐트타입을 보고 표현할 수 있는 형식이면 해당 형식으로 표현하고,
		//잘모르거나 바이너리 파일이라면 다운로드 창을 실행시켜 다운로드 받도록 처리한다.
		
		//4. response객체 헤더에 다운로드 받을 파일명을 기술해준다.
		//헤더에 기술할 수 있는 charset은 ISO-8859-1
		//fname은 UTF-8로 인코드 처리되어 들어온 파라미터(한글이 잘 처리됨)
		//헤더에는 한글을 그대로 넣을 수 없으므로 8859-1로 처리해서 넘기자.
		String fname_en=new String(fname.getBytes(),"ISO-8859-1");
		String str="attachment; filename="+fname_en;
		res.setHeader("Content-Disposition", str);
		//5. FileInputStream과 2번 경로를 연결해서 노드 연결=>필터링
		BufferedInputStream bis=new BufferedInputStream(new FileInputStream(path));
		
		//6. 브라우저와 연결된 출력스트림(ServletOutputStream)을 통해 클라이언트쪽에 내보낸다.
		ServletOutputStream sos=res.getOutputStream();
		BufferedOutputStream bos=new BufferedOutputStream(sos);
		
		byte[] data=new byte[4000];
		int n=0;
		while((n=bis.read(data))!=-1) {
			bos.write(data,0,n);
			bos.flush();
		}
		//7. 자원연결 반납.
		bos.close();
		sos.close();
		bis.close();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		download(request,response);
	}

}
