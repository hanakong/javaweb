package study2.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

@SuppressWarnings("serial")
@WebServlet("/AjaxTest1_2")
public class AjaxTest1_2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberMidCheck(mid);
		
		String name = "";
		if(vo.getName() == null) {
			name = "찾는 자료가 없습니다.";
		}
		else {
			name = vo.getName();
		}
//		PrintWriter out = response.getWriter();
		response.getWriter().write(name);//헤드에 내용을 담아 보낸다. 이때 보내는 내용은 무조건 문자형식이어야한다.
	}
}
