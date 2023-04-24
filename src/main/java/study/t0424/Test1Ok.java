package study.t0424;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/t0424/Test1Ok")
public class Test1Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		한글처리를 필터에서 하게되면 아래 2줄 생략가능
//		request.setCharacterEncoding("utf-8");
//		response.setContentType("text/html ; charset=utf-8");
		
//		 null 체크...
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		int age =  request.getParameter("age")==null ? 0 : Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender")==null ? "" : request.getParameter("gender");
		String job = request.getParameter("job")==null ? "" : request.getParameter("job");
		String address = request.getParameter("address")==null ? "" : request.getParameter("address");
		
//		 DB에 데이터를 넣고 싶다면 입력받은 변수의 값을 VO에 담아서 처리해야한다.
		Test1VO vo = new Test1VO();
		
		vo.setName(name);
		vo.setAge(age);
		vo.setGender(gender);
		vo.setJob(job);
		vo.setAddress(address);
		
//		 VO에 담긴 자료를 DB에 저장하는 작업처리가 일어난다.
		
		
//		처리된 자료들을 view에 보여주기 위해서는 저장소(request)에 담아 넘겨줘야한다.
		request.setAttribute("vo", vo);
		String viewPage = "/study/0424/test1Res.jsp";
//		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
//		dispatcher.forward(request, response);
//		 위 두줄을 한줄로 처리하는 방법
		request.getRequestDispatcher(viewPage).forward(request, response);
		
	}
}
