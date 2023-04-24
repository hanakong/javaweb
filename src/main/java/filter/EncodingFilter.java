package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

//filter는 상속을 받지 않고 구현객체로... 
@WebFilter("/*") //1. web.xml을 통해 하는 방법 2. 어노테이션을 사용하는 방법이 있다
public class EncodingFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
//		System.out.println("1. 이곳은 Filter 통과하기 전입니다.");
		
		chain.doFilter(request, response);
		
//		System.out.println("2. 이곳은 Filter 통과한 후입니다.");
		
	}

}
