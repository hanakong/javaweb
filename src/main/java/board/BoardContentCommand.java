package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardContentCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		BoardDAO dao = new BoardDAO();
		
		//글 조회수 1 증가시키기 //세션 : board+고유번호로 생성할 것임(객체배열(arraylist사용))
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		ArrayList<String> contentIdx = (ArrayList<String>) session.getAttribute("sContentIdx");
		if(contentIdx == null) {
			contentIdx = new ArrayList<String>();
		}
		String imsiContentIdx = "board" + idx;
		if(!contentIdx.contains(imsiContentIdx)) {
			dao.setReadNumUpdate(idx);
			contentIdx.add(imsiContentIdx);
		}
		
		session.setAttribute("sContentIdx", contentIdx);
		
		
		// 현재 선택된 게시글(idx)의 전체 내용물을 가져오기
		BoardVO vo = dao.getBoardContent(idx);
		
		request.setAttribute("vo", vo);
	}

}
