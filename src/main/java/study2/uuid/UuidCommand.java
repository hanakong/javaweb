package study2.uuid;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class UuidCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//많이 쓰기 때문에 메모리에 올려놓고 쓴다...
		UUID uuid = UUID.randomUUID();
		
		request.setAttribute("uuid", uuid);
		
		
//		public static String newPasswordTwo(){
//			 return UUID.randomUUID().toString().replace("-","").substring(0,10).toUpperCase();
//			}
//
//			public static void main(String[] args) {
//			System.out.println("임시 비밀번호-2 =" + newPasswordTwo());//랜덤으로 10자리 출력
//			}
	}
}
