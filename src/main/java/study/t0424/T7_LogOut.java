package study.t0424;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/t0424/T7_LogOut")
public class T7_LogOut extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Cookie[] cookies = request.getCookies();

		for(int i=0; i<cookies.length; i++) {
			cookies[i].setMaxAge(0);
			response.addCookie(cookies[i]);
		}
		
		PrintWriter out = response.getWriter();
		out.print("<script>");
		out.print("alert('로그아웃 되었습니다.');");
		out.print("location.href='"+request.getContextPath()+"/study/0425_storage/t7_Login.jsp';");
		out.print("</script>");
	}
}
