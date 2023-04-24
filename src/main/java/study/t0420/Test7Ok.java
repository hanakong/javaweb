package study.t0420;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/t0420/Test7Ok")
public class Test7Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
		String name = req.getParameter("name");
		String part = req.getParameter("part");
		String[] products = req.getParameterValues("product");
		String[] prices = req.getParameterValues("price");
		String[] sus = req.getParameterValues("su");
		int[] res = new int[products.length];
		int totPrice = 0;
		
		// 계산 결과를 콘솔에 출력하자
		for(int i=0; i<products.length; i++) {
			res[i] = Integer.parseInt(prices[i]) * Integer.parseInt(sus[i]);
			totPrice += res[i];
			
			System.out.print((i+1)+". 상품명"+ products[i] + "\t");
			System.out.print("가격"+ prices[i] + "\t");
			System.out.print("수량"+ sus[i] + "\t");
			System.out.print("가격"+ res[i] + "\n");
		}
		System.out.println("총 가격 합계 : " +totPrice);
		
		PrintWriter out = resp.getWriter();
		
		out.print("<script>");
		out.print("alert('작업완료');");
		out.print("location.href = '"+req.getContextPath()+"/study/0420/test7.jsp';");
		out.print("</script>");
	}
}
