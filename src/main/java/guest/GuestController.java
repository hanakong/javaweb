package guest;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.gu")
public class GuestController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GuestInterface command = null;
		String viewPage = "/WEB-INF/guest";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		if(com.equals("/GuestList")) {
			command = new GuestListCommand(); //GuestListCommand 객체 생성
			command.execute(request, response);
			viewPage += "/guestList.jsp";
		}
		else if(com.equals("/GuestInput")) {
//			command = new GuestInputCommand(); //input에서 가져올게 없으므로 
			viewPage += "/guestInput.jsp";
		}
		else if(com.equals("/GuestInputOk")) {
			command = new GuestInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/AdminLogin")) {
			viewPage += "/adminLogin.jsp";
		}
		else if(com.equals("/AdminLoginOk")) {
			command = new AdminLoginOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/AdminLogout")) {
			command = new AdminLogoutCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
