package study.t0420;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/Test3Ok")
public class Test3Ok2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
		String name = req.getParameter("name");
		int age = Integer.parseInt(req.getParameter("age"));
		String gender = req.getParameter("gender");
		
		String[] hobbys = req.getParameterValues("hobby");
		String strHobby = "";
		for(String hobby : hobbys) {
			strHobby += hobby + " / ";
		}
		strHobby = strHobby.substring(0, strHobby.length()-3);
		System.out.println("성명 : " + name);
		System.out.println("나이 : " + age);
		System.out.println("성별 : " + gender);
		System.out.println("취미 : " + strHobby);
		
		// DB에 자료 저장 후 view로 이동하기
		PrintWriter out = resp.getWriter();
		//location.href(자바스크립트)
		
		out.print("<script>");
		out.print("alert('자료가 저장되었습니다.');");
		out.print("location.href = '"+req.getContextPath()+"/study/0420/test3.jsp';");
		out.print("</script>");
		
	}
}
