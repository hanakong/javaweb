package study2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import study2.ajax2.UserDeleteCommand;
import study2.ajax2.UserInputCommand;
import study2.ajax2.UserListCommand;
import study2.ajax2.UserSearchCommand;
import study2.ajax2.UserUpdateCommand;
import study2.api.crime.DeleteCrimeDataCommand;
import study2.api.crime.SaveCrimeDataCommand;
import study2.calendar.Calendar2Command;
import study2.calendar.CalendarCommand;
import study2.modal.ModalTest2Command;
import study2.password.PassOk1Command;
import study2.password.PassOk2Command;
import study2.pdstest.DownLoadCommand;
import study2.pdstest.FileDeleteCommand;
import study2.pdstest.FileDownLoadCommand;
import study2.pdstest.FileUpLoad1OkCommand;
import study2.pdstest.FileUpLoad2OkCommand;
import study2.pdstest.FileUpLoad3OkCommand;
import study2.pdstest.FileUpLoad4OkCommand;
import study2.uuid.UuidCommand;

@SuppressWarnings("serial")
@WebServlet("*.st")
public class StudyController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudyInterface command = null;
		String viewPage = "/WEB-INF/study2";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel") == null ? 99 : (int)session.getAttribute("sLevel");
		
		if(level > 4) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/");
			dispatcher.forward(request, response);
		}
		else if(com.equals("/Password")) {
			viewPage += "/password/password.jsp";
		}
		else if(com.equals("/PassOk1")){
			command = new PassOk1Command();
			command.execute(request, response);
			viewPage += "/password/password.jsp";
		}
		else if(com.equals("/PassOk2")){
			command = new PassOk2Command();
			command.execute(request, response);
			viewPage += "/password/password2.jsp";
		}
		else if(com.equals("/UuidForm")){
			viewPage += "/uuid/uuidForm.jsp";
		}
		else if(com.equals("/Uuid")){
			command = new UuidCommand();
			command.execute(request, response);
			viewPage += "/uuid/uuidOk.jsp";
		}
		else if(com.equals("/AjaxTest1")){
			viewPage += "/ajax/ajaxTest1.jsp";
		}
		else if(com.equals("/UserList")){
			command = new UserListCommand();
			command.execute(request, response);
			viewPage += "/ajax2/userList.jsp";
		}
		else if(com.equals("/UserInput")){
			command = new UserInputCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/UserDelete")){
			command = new UserDeleteCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/UserSearch")){
			command = new UserSearchCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/UserUpdate")){
			command = new UserUpdateCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/FileUpLoad1")){
			viewPage += "/pdstest/upLoad1.jsp";
		}
		else if(com.equals("/FileUpLoad1Ok")){
			command = new FileUpLoad1OkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/FileUpLoad2")){
			viewPage += "/pdstest/upLoad2.jsp";
		}
		else if(com.equals("/FileUpLoad2Ok")){
			command = new FileUpLoad2OkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/FileUpLoad3")){
			viewPage += "/pdstest/upLoad3.jsp";
		}
		else if(com.equals("/FileUpLoad3Ok")){
			command = new FileUpLoad3OkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/FileUpLoad4")){
			viewPage += "/pdstest/upLoad4.jsp";
		}
		else if(com.equals("/FileUpLoad4Ok")){
			command = new FileUpLoad4OkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/DownLoad")){
			command = new DownLoadCommand();
			command.execute(request, response);
			viewPage += "/pdstest/downLoad.jsp";
		}
		else if(com.equals("/FileDownLoad")){
			command = new FileDownLoadCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/FileDelete")){
			command = new FileDeleteCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/ModalTest1")){
			viewPage += "/modal/modalTest1.jsp";
		}
		else if(com.equals("/ModalTest2")){
			command = new ModalTest2Command();
			command.execute(request, response);
			viewPage += "/modal/modalTest2.jsp";
		}
		else if(com.equals("/Calendar")){
			command = new CalendarCommand();
			command.execute(request, response);
			viewPage += "/calendar/calendar.jsp";
		}
		else if(com.equals("/Calendar2")){
			command = new Calendar2Command();
			command.execute(request, response);
			viewPage += "/calendar/calendar2.jsp";
		}
		else if(com.equals("/APITest")){
			viewPage += "/api/apiTest.jsp";
		}
		else if(com.equals("/CrimeAPI")){
			viewPage += "/api/crime/crimeAPI.jsp";
		}
		else if(com.equals("/SaveCrimeData")){
			command = new SaveCrimeDataCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/DeleteCrimeData")){
			command = new DeleteCrimeDataCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/PhotoView1")){
			viewPage += "/photo/photoView1.jsp";
		}
		else if(com.equals("/PhotoView2")){
			viewPage += "/photo/photoView2.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
