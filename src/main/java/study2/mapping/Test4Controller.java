package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
//@WebServlet({"/mapping/Test4","/mapping/Test1"})
@WebServlet("/mapping/Test4")
public class Test4Controller extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int su1 = request.getParameter("su1")==null ? 0 : Integer.parseInt(request.getParameter("su1"));
		int su2 = request.getParameter("su2")==null ? 0 : Integer.parseInt(request.getParameter("su2"));
		
		Test4Command t4 = new Test4Command(su1, su2);
		int hap = t4.test4Calc();
		Test4Command2 t4_2 = new Test4Command2(su1, su2);
		int cha = t4_2.test4Calc();
		
		request.setAttribute("hap", hap);
		request.setAttribute("cha", cha);
		
		String viewPage = "/WEB-INF/study2/mapping/test1.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
