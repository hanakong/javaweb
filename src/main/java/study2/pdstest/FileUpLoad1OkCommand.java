package study2.pdstest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import study2.StudyInterface;

public class FileUpLoad1OkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String fName = request.getParameter("fName") == null ? "" : request.getParameter("fName");
//		System.out.println("pdstest에서 넘어온 파일명? : " + fName);
		/*
		  COS 라이브러리에서 제공해주는 객체 : MultipartRequest() = 중요한일은 얘가 다 함 / DefaultFileRenamePolicy() = 파일명만 중복제거 해줌
		  사용법 : MultipartRequest(저장소명(request),"서버에 저장될 파일의 경로","서버에 저장될 파일의 최대용량","코드변환방식"(한글 사용할 수도 있기 때문),"기타옵션"(파일명 중복방지처리))
		  서버에 저장될 파일의 경로를 알아야한다. 
		  경로를 알아내는 명령어 : request.getServletContext().getRealPath("경로명");
		  업로드 경로 :  
		  D:\javaweb\JSP\works\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\javaweb\images\pdstest
		  contextPath = javaweb까지
		  
		  ServletContext application = request.getServletContext(); //어플리케이션은 이렇게 사용
		  String realPath = request.getServletContext().getRealPath("/images/pdstest");
		  
		*/		
		String realPath = request.getServletContext().getRealPath("/images/pdstest"); //2번 조건 
//		System.out.println("realPath : " + realPath);
		
		int maxSize = 1024 * 1024 * 10; //파일 업로드 최대용량 설정 //3번 조건
		String encoding = "UTF-8"; //4번 조건
	
		//파일 업로드 처리 (객체가 생성되면서 파일이 업로드된다.)
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		//업로드된 파일의 정보를 추출해보자
		String originalFileName = multipartRequest.getOriginalFileName("fName"); //업로드한 파일명
		String filesystemName = multipartRequest.getFilesystemName("fName");
		
		System.out.println("원본 파일명 : " + originalFileName);
		System.out.println("서버 경로 : " + realPath); 
		System.out.println("서버에 저장된 파일명 : " + filesystemName);
		
		if(!originalFileName.equals("")) {
			request.setAttribute("msg", "파일이 업로드 되었습니다.");
		}
		else {
			request.setAttribute("msg", "파일 업로드 실패");
		}
		request.setAttribute("url", request.getContextPath()+"/pdstest/FileUpLoad1.st");
		
	}
}
