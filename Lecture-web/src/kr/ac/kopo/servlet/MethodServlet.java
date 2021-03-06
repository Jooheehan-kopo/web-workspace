package kr.ac.kopo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MethodServlet extends HttpServlet { // 자식이 부모를 오버라이드할때 자식의 접근제한자는 부모보다 크거나 같을 수 있음.
	//  http://localhost:9999/Lecture-web/method?id=angki_95

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// System.out.println("doGet()호출,,,");

		// 서버에게 요청
		String method = request.getMethod(); // get방식인지, post 인지. 알려줌.
//		System.out.println("method: "+ method);

		StringBuffer url = request.getRequestURL(); // String 하면 속도 느려짐. 다 + 라서.
//		System.out.println("url: "+ url.toString());  //주소 다보며줌

		String uri = request.getRequestURI(); // 뒤의 값만 보여줌.
//		System.out.println("uri: " + uri);

		String id = request.getParameter("id"); // 입력받은 id 를 가져오려고 할때 ,리덭값 무조건 스트링
//		System.out.println("id: "+ id);

		// 클라이언트에게 응답. -> io : outputStream, writer. 가 필요함.
		response.setContentType("text/html; charset=utf-8"); // 택슻트중 html
		PrintWriter out = response.getWriter(); // 아웃풋장치를 얻어옴.PrintWriter가 리턴타입임.
		out.println("<html>");
		out.println("	<head>");
		out.println("		<title> 메소드 호출방식</title>");
		out.println("	</head>");
		out.println("	<body>");
		out.println("====================================================<br>");
		out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;요 청 결 과<br>");
		out.println("====================================================<br>");
		out.println("파라미터(id) : " + id + "<br>");
		out.println("요청방식 : " + method + "<br>");
		out.println("요청uri : " + uri + "<br>");
		out.println("====================================================<br>");
		out.println("	</body>");
		out.println("<html>");

		out.flush();
		out.close(); // 접속을 해제
		// 값을 넘겨줌. setContentType : 넘기려고 하는 콘텐츠의 타입을 설정해줌. --> 응답하기 전에 리스폰스 한줄 써줌!

	}

	// post() 방식

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8"); //post 방식일때. 무조건 사용해야함. - 바디부분의 한글을 올바르게 해석할 수 있도록.
		String method = request.getMethod();  //다 호출할때는 써야함.
		String uri = request.getRequestURI();
		String id = request.getParameter("id");

//		System.out.println("method: " + method);
//		System.out.println("uri: " + uri);

		response.setContentType("text/html; charset=utf-8");  // test라고 쓰면 다운로드 받아짐,,, 조심해야함..
		PrintWriter out = response.getWriter(); // io 출력하기위함임.
		out.println("<html>");
		out.println("<head>");
		out.println("<title>메소드 호출방식 = Post</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<====================================================>");
		out.println("&nbsp;&nbsp;&nbsp; 출력결과<br>");
		out.println("<====================================================>");
		out.println("요청 uri: " + uri + "<br>");
		out.println("요청  메소드: " + method + "<br>");
		out.println("파라미터(id): " + id + "<br>");
		out.println("<====================================================>");
		out.println("</body>");
		out.println("</html>");

		out.flush();
		out.close();
	}

}
