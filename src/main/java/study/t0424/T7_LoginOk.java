package study.t0424;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/t0424/T7_LoginOk")
public class T7_LoginOk extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String check = request.getParameter("idSaver")==null ? "" : request.getParameter("idSaver");
		System.out.println(mid);
		System.out.println(pwd);
		System.out.println(check);
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		if(mid.equals("admin") && pwd.equals("1234")) {
			if(check.equals("1")) {
				Cookie cookieMid = new Cookie("cMid", mid);
				cookieMid.setPath("/");
				cookieMid.setMaxAge(60*20);
				response.addCookie(cookieMid);
				session.setAttribute("sMid", mid);
				out.print("<script>");
				out.print("alert('"+mid+"님 로그인 되었습니다.');");
				out.print("location.href='"+request.getContextPath()+"/study/0425_storage/t7_member.jsp';");
				out.print("</script>");
			}
			else {
				Cookie cookieMid = new Cookie("mid", mid);
				cookieMid.setPath("/");
				cookieMid.setMaxAge(0);
				response.addCookie(cookieMid);
				session.setAttribute("sMid", mid);
				out.print("<script>");
				out.print("alert('"+mid+"님 로그인 되었습니다.');");
				out.print("location.href='"+request.getContextPath()+"/study/0425_storage/t7_member.jsp';");
				out.print("</script>");
			}
		}
		else {
			out.print("<script>");
			out.print("alert('아이디 혹은 비밀번호를 확인하여주세요.');");
			out.print("location.href='"+request.getContextPath()+"/study/0425_storage/t7_Login.jsp';");
			out.print("</script>");
		}
	}
}
