package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//회원가입의 정보를 가져와서 백엔드 체크를 하고 DB에 값을 전달하는 역할
@SuppressWarnings("serial")
@WebServlet("/database/JoinOk")
public class JoinOk extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		
		LoginVO vo = new LoginVO();
		
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name);
		
		LoginDAO dao = new LoginDAO();
		LoginVO vo2 = dao.getMidCheck(mid);
		
		String msg = "";
		if(vo2.getMid() != null) {
			// 아이디 중복
			msg = "아이디가 중복되었습니다.";
		}
		else {
			// 아이디가 중복되어 있지 않으므로 DB에 회원가입정보 저장
			dao.setJoinOk(vo);
			msg = "회원가입 되었습니다.";
		}
		request.setAttribute("msg", msg);
	}
}
