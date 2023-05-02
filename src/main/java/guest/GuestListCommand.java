package guest;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuestListCommand implements GuestInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GuestDAO dao = new GuestDAO();
		
		// 1. 현재 페이지 번호를 구한다.
		//jsp에서 page는 예약어이므로 pag로 적어준다.
		// 이전/ 다음을 누르면 page가 넘어오지만 그렇지 않을 경우는 1을 넘긴다.
		int pag = request.getParameter("pag") == null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize") == null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		// 2. 한페이지의 분량을 결정한다.
//		int pageSize = 5;
		// 3. 총 레코드 건수를 구한다.
		int totRecCnt = dao.getTotalRecCnt();
		// 4. 총 페이지 건수를 구한다.
		int totPage = (totRecCnt % pageSize) == 0 ? (totRecCnt/pageSize) : (totRecCnt/pageSize) + 1 ;  
		// 5. 현재 페이지의 시작 인덱스 번호 구하기
		int startIndexNo = (pag -1) * pageSize;
		// 6. 화면에 표시할 시작 번호 구하기
		int curScrStartNo = totRecCnt - startIndexNo;
		
		// 블록 페이징 처리 // 블록의 시작번호를 0부터 처리 <<  < 1 2 3 >  >> 일 때, 123이 한 블록
		// 1. 블록의 크기를 결정한다. (여기선 3으로 결정 후 처리)
		int blockSize = 3;
		// 2. 현재 페이지가 속한 블록 번호를 구한다. (예 : 1,2,3페이지는 0블록, 4,5,6페이지가 1블록
		int curBlock = (pag - 1) / blockSize;
		// 3. 마지막 블록을 구한다.
		int lastBlock = (totPage -1) / blockSize; 
			
		// 지정된 페이지의 자료를 요청한 한페이지 분량만큼 가져온다. 
		ArrayList<GuestVO> vos = dao.getGuestList(startIndexNo, pageSize);
		
		request.setAttribute("vos", vos);
		request.setAttribute("pag", pag);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
		request.setAttribute("pageSize", pageSize);
	}
}
