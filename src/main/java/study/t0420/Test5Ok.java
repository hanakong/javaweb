package study.t0420;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/t0420/Test5Ok")
public class Test5Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		int[] suss = new int[5];
		String[] sus = req.getParameterValues("su");  
		for(int i=0; i<sus.length;i++) {
			suss[i] = Integer.parseInt(sus[i]);
		}
		Arrays.sort(suss);
		
		for(int i=0; i<5; i++) {
			System.out.print(suss[i]);
			System.out.print("/");
		}
		
	}
}
