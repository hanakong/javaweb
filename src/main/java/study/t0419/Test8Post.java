package study.t0419;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@SuppressWarnings("serial")
@WebServlet({"/t8Post","/t8p"})
public class Test8Post extends HttpServlet {
	//post인지 get인지 사용하면서 헷갈림 틀리게 되면 405 오류 발생
	// service 메소드를 사용하면 get으로 받던 post로 받던 신경쓰지 않고 사용할 수 있다
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//sever의 자료를 요청해서 자료를 utf-8로 변환해서 보내달라 요청하는 것
		request.setCharacterEncoding("utf-8");
		//was가 sever로 응답할 때 html, utf-8로 보내
		response.setContentType("text/html; charset=utf-8");
		
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		System.out.println("성명 : " + name);
		System.out.println("나이 : " + age);
		
		PrintWriter out = response.getWriter();
		
		out.print("성명 : " + name +"<br/>");
		out.print("나이 : " + age +"<br/>");
//		out.print("<a href='/javaweb/study/0419/test8.jsp'>돌아가기</a>");
		out.print("<a href='"+request.getContextPath()+"/study/0419/test8.jsp'>돌아가기</a>");
		//webapp 밑에 경로들만 신경쓰면 됨
		
	}
}
