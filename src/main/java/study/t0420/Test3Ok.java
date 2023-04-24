package study.t0420;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/t0420/Test3Ok")
public class Test3Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		
		String[] hobbys = request.getParameterValues("hobby");
		String strHobby = "";
		for(String hobby : hobbys) {
			strHobby += hobby + " / ";
			//server storage//
			//내장객체
			//저장소(model) :
			//1)pageContext : 
			//2)request : response와 함께 입력된 id,pwd같은거 처리할 때 사용
			//3)session : 로그인과 로그아웃처리(클라이언트 단위로 정보를 유지하고 싶을 때 사용)
			//4)application : 서버에 대한 정보 추출, 웹 어플리케이션 단위로 상태 정보를 유지하기 위해 사용
			//client storage//
			//cookie
			//서버 부하를 줄이려면 cookie에 저장~  
		}
		strHobby = strHobby.substring(0, strHobby.length()-3);
		System.out.println("성명 : " + name);
		System.out.println("나이 : " + age);
		System.out.println("성별 : " + gender);
		System.out.println("취미 : " + strHobby);
		
//		PrintWriter out = response.getWriter();
		//location.href(자바스크립트)
		
//		 백엔드에서는 이렇게 사용 안함
//		 밑에 out.~~~는 뷰에서 나와야하는 것이기 때문
//		out.print("<script>");
//		out.print("alert('자료가 저장되었습니다.');");
//		out.print("location.href = '"+request.getContextPath()+"/study/0420/test3.jsp';");
//		out.print("</script>");
		
		// DB에 자료 저장 후 view로 이동하기
		// 보내는 방법은 2가지가 있다. 1)location.href와 비슷한 명령 사용 2.)직렬화(serialize)
		name = URLEncoder.encode(name,"utf-8");
		response.sendRedirect(request.getContextPath()+"/study/0420/test3Res.jsp;"); //방법 1)location.href와 같은 역할의 명령어 사용
//		RequestDispatcher dispatcher = request.getRequestDispatcher("/study/0420/test3Res.jsp?name="+name);
		//직렬화이기때문에 contextpath를 쓸 필요가 없다
//		dispatcher.forward(request, response);
	}
}
