package study.t0421;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/t0421/Test1Ok")
public class Test1Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
	/*
//		String mid = request.getParameter("mid");
		String mid="";
		if(request.getParameter("mid") == null) mid = "";
		
		String name = request.getParameter("name");
		
//		if(mid.equals("admin")) {
		if(request.getParameter("mid").equals("admin")) {
			System.out.println("관리자님이시군요");
		}
		else {
			System.out.println("방문객이시군요");
		}
	*/
		//null 값 처리는 필수... post로 보내면 오류 발생X DB에서 오류가 나기 때문에 반드시 null값 처리를 해줘야한다.
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String job = request.getParameter("job")==null ?  "" : request.getParameter("job");
		
		System.out.println("mid : "  + mid);
		System.out.println("name : " + name);
		System.out.println("job : " + job);
		
		request.setAttribute("mid", mid);
		request.setAttribute("name", name);
		request.setAttribute("job", job);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/study/0421/test1Res2.jsp");
		// 절대경로를 괄호안에 넣어 표시하면 중복되기 때문에 빼야한다.
		dispatcher.forward(request, response);
	}
}
