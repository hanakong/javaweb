package study2.pdstest;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class FileDownLoadCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		  1. 값을 넘겨받는다.
		  2. 파일 업로드 경로 확인
		  3. 경로와 파일명(합쳐서) 객체 생성
		  4. 
		 */
		
		//multipartrequest? 그냥 request?
		String fName = request.getParameter("file") == null ? "" : request.getParameter("file");

		//경로는 안넘어오므로 다시 적어준다.
		String realPath = request.getServletContext().getRealPath("/images/pdstest");
//  getServletContext : 페이지에 대한 서블릿 실행 환경 정보를 담고 있는 application 내장 객체를 리턴한다
//	getContextPath() : 프로젝트 path만 얻어옴 
//  getRealPath() : 서버or 로컬 웹 어플리케이션 서버의 설정값을 반환한다.(절대경로 가져오기?)
//	getRequestURI()	: 프로젝트와 파일경로까지 얻어옴 (전체 URL중 Port번호 다음부터 마지막 문자열까지 반환함)
//	getRequestURL() : 전체 경로를 가져옴
		
		// 다운로드 하려면 경로를 합쳐줘야한다 그냥 +를 하면 /images/pdstesta.jpg가 되므로 중간에 /를 하나 넣어줘야한다.
		File file  = new File(realPath +"/"+ fName); // 혹은 19번줄 getRealPagt("/images/pdstest/")라고 넣어도 된다.
		 
		/* 프로토콜형식에 맞도록 헤더에 정보를 제공해준다. */
	//파일의 정보를 가져온다. // mimeType : 파일형식(예: 텍스트파일, 바이너리파일.. 등을 관리해준다. --> 파일전송시 자바에서는 2진 바이너리형식으로 전송처리한다.
		String mimeType = request.getServletContext().getMimeType(file.toString());
		if(mimeType == null) {
			response.setContentType("application/octet-stream"); // 이 타입은 이진 파일을 위한 기본값
		/* mimetype = MIME 타입이란 클라이언트에게 전송된 문서의 다양성을 알려주기 위한 메커니즘
		  웹에서 파일의 확장자는 별 의미가 없습니다. 그러므로, 각 문서와 함께 올바른 MIME 타입을 전송하도록, 서버가 정확히 설정하는 것이 중요합니다.
		  브라우저들은 리소스를 내려받았을 때 해야 할 기본 동작이 무엇인지를 결정하기 위해 대게 MIME 타입을 사용합니다.
			'/'로 구분된 두 개의 문자열인 타입과 서브타입으로 구성 ex.) text/plain, text/html, image/jpeg, application/octet-stream ... etc
			MIME 타입은 대소문자를 구분하지는 않지만 전통적으로 소문자로 쓰여집니다// MIME 타입은 문서 타입 정보를 실어나르는 유일한 방법은 아닙니다:
		*/
		}
		
		// 사용하는 브라우저에 대한 정보 : 인터넷 익스플로러(IE)에서의 인코딩방식은 'euc-kr'로, 나머지는 'utf-8'로 전송처리한다.
		String downLoadName = "";
		if(request.getHeader("user-agent").indexOf("MSIE") == -1) {	// msie = microsoft internet explorer
			/*
			 	request.getHeader("referer"); : 접속 경로
				request.getHeader("user-agent"); : 유저의 시스템 정보
				request.getHeader("host"); : 접속 IP
				request.getHeader("User-Agent");  브라우져 정보 가져오기
				request.getHeader("WL-Proxy-Client-IP")
				request.getHeader("Proxy-Client-IP")
				request.getHeader("X-Forwarded-For") // 클라이언트 ip 주소 가져오기
			 */
			downLoadName = new String(fName.getBytes("utf-8"), "8859_1"); // getBytes : 문자를 문자 배열로 바꿔준다.
		}
		else { 
			downLoadName = new String(fName.getBytes("EUC-KR"),"8859_1");
		}
		
		//헤더 정보를 첨부하여 클라이언트에게 전송할 준비를 한다.
		response.setHeader("Content-Disposition", "attachment;filename="+downLoadName);
		// 브라우저 인식 파일확장자를 포함하여 모든 확장자의 파일들에 대해,  다운로드시 무조건 "파일 다운로드" 대화상자가 뜨도록 하는 헤더속성이라 할 수 있다.
		//여태까지 헤더에 내용을 실었다. 
		
		// JAVA에 의해서 실제로 파일을 다운(업)로드 처리시켜준다. (FileInputStream/FileOutputSteam)
		 FileInputStream fis = new FileInputStream(file);
		 // 파일로 부터 바이트로 입력받아, 바이트 단위로 출력할 수 있는 클래스
		 // System.out.write() 를 이용하여 실제 파일의 내용을 확인 할 수 있다.
		 //중요한 것은 IO 클래스를 생성한 후 에는 항상 close() 메소드를 호출하여 닫아 주어야 한다.
		 //finally 블록을 이용하여 닫아주도록 한다.
		 //FileInputStream 의 Read() 는 파일의 내용을 바이트 단위로 읽어 들린후 정수로 반환한다.
		 ServletOutputStream sos = response.getOutputStream();
		 /*
			  파일을 읽어올 때에는 FileInputStream으로 읽어온 뒤 브라우저에 출력할 때에는 ServletOutputStream을 사용한다.
				ServletOutputStream의 용도는 게시판에 파일을 올릴 때 사용한다.
				ServletOutputStream 은 추상클래스이기 때문에 인스턴스를 생성할 수 없다.
				ServletResponse 클래스에 getOutputStream()이라는 함수를 통해 servletOutputStream 인스턴스를 받아서 사용해야한다.
		  */
		 
		// 전송할 객체를 생성한 후에는 파일을 객체에 byte단위로 담아서 처리시켜준다. 2kb씩 담아서 움직일게요
		 byte[] b = new byte[2048];
		 // 1bit씩 읽어오므로 속도를 위해 2kb로 데이터값을 설정해준다.
		 int data = 0; //비교하기 위한 변수
		 
		 while((data = fis.read(b,0,b.length)) != -1) { // read(byte크기, 시작위치, 끝 위치) b.legth만큼만 읽어서 배열의 0번째부터 b의 크기로 저장
			 sos.write(b, 0, data); // 데이터가 딱 2048로 떨어지지 않으므로 // 0부터 data만큼 b의 크기만큼 읽어라
		 }
		 sos.flush(); // 혹시 남았을지도 모를 데이터를 보내준다.
		 // flush()는 현재 버퍼에 저장되어 있는 내용을 클라이언트로 전송하고 버퍼를 비운다.
		 // 출력 스트림과 버퍼된 출력 바이트를 강제로 쓰게 한다.
		 // 여기까지 다운로드 완료
		 // 이후 사용된 객체를 모두 반납해야한다. // 닫을 땐 거꾸로 닫아야한다.
		 
		 sos.close();
		 fis.close();
		 
	}
}
