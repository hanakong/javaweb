package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberIdCheckCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		System.out.println(mid);
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberMidCheck(mid);
		
		if(vo.getMid() == null) {
			request.setAttribute("res", 1); // 사용가능
		}
		else {
			request.setAttribute("res", 0); // 중복
		}
		request.setAttribute("mid", mid);
	}
}
