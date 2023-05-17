package study2.calendar;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class CalendarCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//오늘 날짜 처리(저장)
		Calendar calToday = Calendar.getInstance(); //싱글톤객체 //이제 년-월-일을 꺼낼 수 있다.
		int toYear = calToday.get(Calendar.YEAR); //열거형으로 오기 때문에 객체명을 적어줘야함 //년
		int toMonth = calToday.get(Calendar.MONTH); //월
		int toDay = calToday.get(Calendar.DATE); //일
		
		//화면에 보여줄 해당 '년/월'을 세팅
		Calendar calView = Calendar.getInstance();
		int yy = request.getParameter("yy") == null ? calView.get(Calendar.YEAR) : Integer.parseInt(request.getParameter("yy"));
		int mm = request.getParameter("mm") == null ? calView.get(Calendar.MONTH) : Integer.parseInt(request.getParameter("mm"));
//		int dd = request.getParameter("dd") == null ? calView.get(Calendar.DATE) : Integer.parseInt(request.getParameter("dd"));
		
		if(mm < 0) {
			yy--;
			mm = 11;
		}
		if(mm > 11) {
			yy++;
			mm = 0;
		}
		//년 월 세팅 완료 이제 날짜만 세팅하면 됨
		// 해당 년/월 의 1일을 기준으로 날짜를 세팅처리한다.
		calView.set(yy, mm, 1);
		
		//앞에서 세팅한 해당 '년/월'의 1일에 해당하는 요일값을 숫자로 가져온다.
		int startWeek = calView.get(Calendar.DAY_OF_WEEK);
//		System.out.println("해당월의 첫번째 1일의 요일을 숫자로 반환 : " + startWeek);

		// 해당 년/월의 마지막 일자를 가져온다. 
		int lastDay = calView.getActualMaximum(Calendar.DAY_OF_MONTH); //윤년을 계산할 필요가 없다.
//		System.out.println("해당월의 마지막 요일을 숫자로 반환 : " + lastDay);
		
		//화면에 보여줄 달력의 해당 내역(년/월/요일숫자) 저장소에 저장하여 넘겨준다.
		request.setAttribute("yy", yy);
		request.setAttribute("mm", mm);
		request.setAttribute("startWeek", startWeek);
		request.setAttribute("lastDay", lastDay);
		
		//오늘 날짜를 저장소에 담아서 넘겨준다.
		request.setAttribute("toYear", toYear);
		request.setAttribute("toMonth", toMonth);
		request.setAttribute("toDay", toDay);
	}
}
