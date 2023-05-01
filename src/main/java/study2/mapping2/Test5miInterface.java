package study2.mapping2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Test5miInterface {
//	interface에서 만들어지는 메소드 : 추상 메소드
// 	interface는 실행하는 곳이 아니라 선언하는 곳
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
}
