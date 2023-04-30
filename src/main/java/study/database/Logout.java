package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/database/Logout")
public class Logout extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		2!!! 아이디 + 로그아웃 처리
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
//		2!!! 완
//		3@@@ 세션 끝내기 //다른 브라우저에서 주소를 입력하고 들어갔을 때 접속이 되므로 접속을 차단하기 위해 여러가지 일을 해요~
		session.invalidate();
//		3@@@
		PrintWriter out = response.getWriter();
		
		out.print("<script>");
		out.print("alert('"+mid+"님 로그아웃 되었습니다.');");
		out.print("location.href='"+request.getContextPath()+"/study/0428_database/login.jsp';");
		out.print("</script>");
	}
}
