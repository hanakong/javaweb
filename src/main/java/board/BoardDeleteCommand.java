package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardDeleteCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 정상적인 경로를 통해서 삭제하지 않을 경우 홈으로 보낸다.
		HttpSession session = request.getSession();
		String sNickName = (String) session.getAttribute("sNickName");
		int sLevel = (int)session.getAttribute("sLevel");
		String nickName = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		System.out.println("sNickName : " + sNickName + ", nickName :" + nickName);
		
		if(sLevel != 0) {
			if(sNickName.equals(nickName)) {
				request.setAttribute("msg", "잘못된 접근입니다.");
				request.setAttribute("url", request.getContextPath()+"/");
				return;
			}
		}
		
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag") == null ? 0 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize") == null ? 0 : Integer.parseInt(request.getParameter("pageSize"));
		
		BoardDAO dao = new BoardDAO();

		//DB 관계 설정할 때 on delete restrict 설정했기 때문에 댓글이 1개 이상 있으면 원본글 삭제가 되지 않는다. 이를 해결하기 위해 댓글이 있는지 확인한다.
//		ArrayList<BoardReplyVO> vos = dao.getBoardReply(idx);
		
//		if(vos.size() != 0) { // 댓글이 있다
//			request.setAttribute("msg", "현 게시글에 댓글이 존재하므로 삭제할 수 없습니다. \\n삭제를 원하신다면 댓글을 먼저 삭제해주세요.");
//			request.setAttribute("url", request.getContextPath()+"/BoardContent.bo?idx="+idx+"&pag="+pag+"&pageSize="+pageSize);
//			return;
//		}
		
		int res = dao.setBoardDelete(idx);
		
		if(res == 1) {
			request.setAttribute("msg", "게시글이 삭제되었습니다.");
			request.setAttribute("url", request.getContextPath() +"/BoardList.bo?pag="+pag+"&pageSize="+pageSize);
		}
		else {
			request.setAttribute("msg", "게시글 삭제 실패.");
			request.setAttribute("url", request.getContextPath() +"/BoardContent.bo?idx="+idx+"&pag="+pag+"&pageSize="+pageSize);
		}
	}
}
