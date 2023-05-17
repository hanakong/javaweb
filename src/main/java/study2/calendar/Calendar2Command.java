package study2.calendar;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import schedule.ScheduleDAO;
import schedule.ScheduleVO;
import study2.StudyInterface;

public class Calendar2Command implements StudyInterface {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			Calendar calToday = Calendar.getInstance(); 
			int toYear = calToday.get(Calendar.YEAR); 
			int toMonth = calToday.get(Calendar.MONTH);
			int toDay = calToday.get(Calendar.DATE);
			
			Calendar calView = Calendar.getInstance();
			int yy = request.getParameter("yy") == null ? calView.get(Calendar.YEAR) : Integer.parseInt(request.getParameter("yy"));
			int mm = request.getParameter("mm") == null ? calView.get(Calendar.MONTH) : Integer.parseInt(request.getParameter("mm"));
			
			if(mm < 0) {
				yy--;
				mm = 11;
			}
			if(mm > 11) {
				yy++;
				mm = 0;
			}
			calView.set(yy, mm, 1);
			int startWeek = calView.get(Calendar.DAY_OF_WEEK);
			int lastDay = calView.getActualMaximum(Calendar.DAY_OF_MONTH);
			
			int prevYear = yy;
			int prevMonth = mm - 1;
			int nextYear = yy;
			int nextMonth = mm + 1;
			
			if(prevMonth < 0) {
				prevYear--;
				prevMonth = 11;
			}
			if(nextMonth > 11) {
				nextYear++;
				nextMonth = 0;
			}
			
			Calendar calPre = Calendar.getInstance();
			calPre.set(prevYear, prevMonth, 1);
			int preLastDay = calPre.getActualMaximum(Calendar.DAY_OF_MONTH);
			
			Calendar calNext = Calendar.getInstance();
			calNext.set(nextYear, nextMonth, 1);
			int nextStartWeek = calNext.get(Calendar.DAY_OF_WEEK);
			
			 request.setAttribute("prevYear", prevYear);
			 request.setAttribute("prevMonth", prevMonth);
			 request.setAttribute("nextYear", nextYear);
			 request.setAttribute("nextMonth", nextMonth);
			 request.setAttribute("preLastDay", preLastDay);
			 request.setAttribute("nextStartWeek", nextStartWeek);
			
			request.setAttribute("yy", yy);
			request.setAttribute("mm", mm);
			request.setAttribute("startWeek", startWeek);
			request.setAttribute("lastDay", lastDay);
			
			request.setAttribute("toYear", toYear);
			request.setAttribute("toMonth", toMonth);
			request.setAttribute("toDay", toDay);
			
			//해당 년/월에 존재하는 일정을 DB에서 가져온다.
			HttpSession session = request.getSession();
			String mid = (String)session.getAttribute("sMid");
			
			//2023-5 => 2023-05
			String ym = "";
			if((mm+1) <10) {
				ym = "0" + (mm+1);
			}else {
				ym = yy + "-" + (mm+1);
			}
			
			ScheduleDAO dao = new ScheduleDAO();
			
			 ArrayList<ScheduleVO> vos = dao.getSchedule(mid, ym, 0);
			 
			 request.setAttribute("vos", vos);
			
		}
}
