package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//do.java라고 쓸 수 없으니 지우고 Test5라고 해도 되지만 헷갈릴 우려가 있으므로 Controller를 붙여줄게요~

@SuppressWarnings("serial")
//@WebServlet("/mapping/Test5.do")
//@WebServlet("*.do") //다른 확장자 패턴은 생략 불가 but do는 생략가능
public class Test5Controller2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StringBuffer url = request.getRequestURL();
		System.out.println(url);
		
		String uri = request.getRequestURI();
		System.out.println(uri);
		
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		System.out.println(com);
		
		String viewPage = "/WEB-INF/study2/mapping/test5.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}