package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberDeleteAskCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String mid = (String)session.getAttribute("sMid");
		
		MemberDAO dao = new MemberDAO();
		
		dao.setDeleteAskOk(mid);
		
		session.invalidate();
		
		request.setAttribute("msg", "탈퇴 성공 \\n 이용해주셔서 감사합니다.");
		request.setAttribute("url", request.getContextPath()+"/");
	}
}
