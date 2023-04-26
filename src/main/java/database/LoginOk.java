package database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/database/LoginOk")
public class LoginOk extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		
		//database와의 연동을 통해 아이디와 비밀번호를 비교
		LoginDAO dao = new LoginDAO();
		
		LoginVO vo = dao.getLoginCheck(mid, pwd); // 아이디와 비밀번호를 검사 (boolean, int, vo타입 등으로 받아와서 일치하는지 아닌지 검사)
		//자료를 받아왔다 자료가 없으면 비회원
		
		// 뷰를 완벽하게 분리하지 못했으므로 java에서 view를 표현하기 위해 printWriter사용
		PrintWriter out = response.getWriter();
		
		if(vo.getName() != null) { // 값이 있으니까 회원 //회원 처리과정
			//2!!!. 회원 인증 후 처리 (1. 자주 사용하는 자료를 세션에 저장(아이디, 성명, 닉네임)
			
			//5%%% 방문 포인트 처리 DAO에게 update를 부탁해요 
			dao.setPointPlus(mid);
			//6^^^ 방문 포인트 + 최종접속일 처리도 같이 해요~ //7&&& 방문카운트도
			
			//과제 DB의 최종 접속일(10자리)와 시스템날짜(10자리)를 비교하여 같으면 todayCount = vo.getTodayCount()+1; 같지않으면 todayCount=0;
			// dao.setPointPlus(mid, todayCount)로 넘기면 됨
			
			
			//2!!!. 1. 세션 처리
			HttpSession session = request.getSession();
			session.setAttribute("sMid", mid);
			session.setAttribute("sName", vo.getName());
			//4### 어딜가든 포인트는 보여야하므로 session에 넣어야한다.
			session.setAttribute("sPoint", vo.getPoint()+10);
			session.setAttribute("sLastDate", vo.getLastDate()); //다시 불러오면 안됨?
			//7&&&
			session.setAttribute("sTodayCount", vo.getTodayCount()+1); //업데이트 했지 읽어오질 않았기 때문에 지금은 이렇게 해줘야한다. 나중엔 아님
			//4###
			//2!!!. memberMain.jsp로 이동
			
			out.print("<script>");
			out.print("alert('"+mid+"님 로그인 되었습니다.');");
			out.print("location.href='"+request.getContextPath()+"/study/0428_database/memberMain.jsp';"); //response.send와 같다 forward와 다름 // 방향 자유자재로 따라서 절대경로 필요 
			out.print("</script>");
		}
		else { // 값이 없으니까 비회원 //비회원 처리과정
			out.print("<script>");
			out.print("alert('로그인 실패!');");
			out.print("location.href='"+request.getContextPath()+"/study/0428_database/login.jsp';"); //response.send와 같다 forward와 다름 // 방향 자유자재로 따라서 절대경로 필요 
			out.print("</script>");
		}
	}
}
