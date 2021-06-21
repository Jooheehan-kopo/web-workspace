package kr.ac.kopo.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet{
	
	//init은 한번하고 없어도 됨.
	/*
	public void init(ServletConfig config)throws ServletException{
		System.out.println("init(): 최초 한번만 실행되는 메소드 입니다.");
	}
	*/
	
	//서비스는 무조건 있어야함
	public void service(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
		//서브와 클라이언트는 내부 통신. io 통신 만들어졌음. 데이터 주고받을때 checked exception. 그래서 예외처리 해준 것임.
		System.out.println("service(): 실제 작업이 실행되는 메소드 입니다.");
		System.out.println("사용자가 요청할 때마다 호출되는 메소드입니다");
		
	}
}
