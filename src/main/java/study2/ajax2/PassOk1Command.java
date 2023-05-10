package study2.ajax2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PassOk1Command implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd").toUpperCase();
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		System.out.println(" == 원본 자료 ==");
		System.out.println("mid : " + mid);
		System.out.println("pwd : " + pwd);
		System.out.println("idx : " + idx);
		System.out.println();
		
		if(idx ==1) {
			// 숫자만을 암호화 하는 경우
			// 암호화를 위한 키 설정(0x1234ABCD)
			int key = 0x1234ABCD;
			
			int encPwd, decPwd;
			//암호화...(EOR(^) 암호화)
			encPwd = Integer.parseInt(pwd) ^ key;
			
			System.out.println(" == 암호화된 자료 ==");
			System.out.println("pwd : " + encPwd);
			System.out.println("--------------- 암호화된 비밀번호를 DB에 저장 --------------------");
			System.out.println("암호화된 비밀번호를 DB에 저장시킨 후 인증을 위해 다시 불러와서 디코딩처리한다.");
			System.out.println();
			
			decPwd = encPwd ^ key;
			
			System.out.println(" == 복호화된 자료 ==");
			System.out.println("pwd : " + decPwd);
			System.out.println();
		}
		else {
//			숫자/문자 혼합을 암호화 하는 경우(영문 소문자 입력시는 대문자로 변경해서 처리할 예정)
//			왜냐하면 아스키 99번까지만 사용할 것이기 때문... 3자리와 2자리 알고리즘이 다르기 때문...
			System.out.println("원본 비밀번호 : " + pwd);
			long intPwd;
			String strPwd = "";
			for(int i=0; i<pwd.length(); i++) {
				intPwd = pwd.charAt(i); //아스키코드로 변환하는 과정 // int를 벗어나는 크기가 주어질 수 있기 때문에, long 부여
				strPwd += intPwd;
			}
			System.out.println("2. 아스키코드문자로 변환된 비밀번호 : " + strPwd);
			
			intPwd = Long.parseLong(strPwd);
			
			long encPwd;
			long key = 0x1234ABCD;
			
			encPwd = intPwd ^ key;
//			strPwd = encPwd + ""; // 문자화 방법 1
			strPwd = String.valueOf(encPwd); // 문자화 방법 2
			System.out.println("3. 암호화된 비밀번호 : " + strPwd);
			System.out.println("--------------- 암호화된 비밀번호를 DB에 저장 --------------------");
			System.out.println();
			
			long decPwd;
			intPwd = Long.parseLong(strPwd);
			decPwd = intPwd ^ key;
			System.out.println("4. 복호화된 비밀번호 : " + decPwd);
			
			// 복원된 비번은 숫자이기에 문자로 변환 후 2자리씩 분리 처리해준다.
			strPwd = String.valueOf(decPwd);
			
			char ch;
			String result = "";
			for(int i=0; i<strPwd.length(); i+=2) {
				ch = (char)Integer.parseInt(strPwd.substring(i,i+2));
				result += ch;
			}
			System.out.println("5. 원래 비밀번호 : " + result);
		}
	}
}
