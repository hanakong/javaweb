package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberMessageInputCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String chat = request.getParameter("chat") == null ? "" : request.getParameter("chat");		
		
		chat = chat.replace("<", "&lt");
		chat = chat.replace(">", "&gt");
		
		HttpSession session = request.getSession();
		String nickName = (String)session.getAttribute("sNickName");
		
		MemberChatVO vo = new MemberChatVO();
		
		vo.setNickName(nickName);
		vo.setChat(chat);
		
		MemberDAO dao = new MemberDAO();
		dao.setMemberMessageInputOk(vo);
	}
}
