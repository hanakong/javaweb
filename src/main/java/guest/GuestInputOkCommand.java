package guest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuestInputOkCommand implements GuestInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		String email = request.getParameter("email") == null ? "" : request.getParameter("email");
		String homePage = request.getParameter("homePage") == null ? "" : request.getParameter("homePage");
		String content = request.getParameter("content") == null ? "" : request.getParameter("content");
		String hostIP = request.getParameter("hostIP") == null ? "" : request.getParameter("hostIP");
		
		name = name.replace("<", "&lt"); // 태그 사용 못하게 만듬
		name = name.replace(">", "&gt");
		
		
		GuestVO vo = new GuestVO();
		
		vo.setName(name);
		vo.setEmail(email);
		vo.setHomePage(homePage);
		vo.setContent(content);
		vo.setHostIP(hostIP);
		
		GuestDAO dao = new GuestDAO();
		
		int res = dao.setGuestInputOk(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "방명록에 글이 등록되었습니다.");	
			request.setAttribute("url", request.getContextPath()+"/GuestList.gu");
		}
		else {
			request.setAttribute("msg", "글 작성 실패");	
			request.setAttribute("url", request.getContextPath()+"/GuestInput.gu");
			
		}

	}

}
