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
			response.setContentType("application/octet-stream"); // 2진 바이너리형식
		}
		
		// 사용하는 브라우저에 대한 정보 : 인터넷 익스플로러(IE)에서의 인코딩방식은 'euc-kr'로, 나머지는 'utf-8'로 전송처리한다.
		String downLoadName = "";
		if(request.getHeader("user-agent").indexOf("MSIE") == -1) {	
			downLoadName = new String(fName.getBytes("utf-8"), "8859_1"); // getBytes : 문자를 문자 배열로 바꿔준다.
		}
		else { 
			downLoadName = new String(fName.getBytes("EUC-KR"),"8859_1");
		}
		
		//헤더 정보를 첨부하여 클라이언트에게 전송할 준비를 한다.
		response.setHeader("Content-Disposition", "attachment;filename="+downLoadName);
		
		//여태까지 헤더에 내용을 실었다. 
		
		// JAVA에 의해서 실제로 파일을 다운(업)로드 처리시켜준다. (FileInputStream/FileOutputSteam)
		 FileInputStream fis = new FileInputStream(file);
		 ServletOutputStream sos = response.getOutputStream();
		 
		// 전송할 객체를 생성한 후에는 파일을 객체에 byte단위로 담아서 처리시켜준다. 2kb씩 담아서 움직일게요
		 byte[] b = new byte[2048];
		 int data = 0; //비교하기 위한 변수
		 
		 while((data = fis.read(b,0,b.length)) != -1) { // 있을 때까지 돌아가라
			 sos.write(b, 0, data); // 데이터가 딱 2048로 떨어지지 않으므로 
		 }
		 sos.flush(); // 혹시 남았을지도 모를 데이터를 보내준다.
		 // 여기까지 다운로드 완료
		 // 이후 사용된 객체를 모두 반납해야한다. // 닫을 땐 거꾸로 닫아야한다.
		 
		 sos.close();
		 fis.close();
		 
	}
}
