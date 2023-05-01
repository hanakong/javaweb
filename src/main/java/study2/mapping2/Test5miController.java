package study2.mapping2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.mapping.Test5Command;

//do.java라고 쓸 수 없으니 지우고 Test5라고 해도 되지만 헷갈릴 우려가 있으므로 Controller를 붙여줄게요~

@SuppressWarnings("serial")
@WebServlet("*.mi")
//다른 확장자 패턴은 생략 불가 but do는 생략가능
public class Test5miController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Test5miInterface command = null;
		String viewPage = "/WEB-INF/study2/mapping2";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		System.out.println(com);
		
		
		if(com.equals("/Test5")) {
			viewPage += "/test5.jsp";
		}
		else if(com.equals("/Test5_2")) {
			viewPage += "/test5_2.jsp";
		}
		else if(com.equals("/Test5_3")) {
			viewPage += "/test5_3.jsp";
		}
		else if(com.equals("/Test5_4")) {
			viewPage += "/test5_4.jsp";
		}
		else if(com.equals("/Test5_5")) {
			
			command = new Test5miCommand();
			command.execute(request, response);
			viewPage += "/test5_5.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
