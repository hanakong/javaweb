// 많이 써요 중간과정이 아니에요~
package study2.pdstest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import study2.StudyInterface;

public class FileUpLoad2OkCommand2 implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String realPath = request.getServletContext().getRealPath("/images/pdstest"); 
		int maxSize = 1024 * 1024 * 10;
		String encoding = "UTF-8";
	
		//파일 업로드 처리 (객체가 생성되면서 파일이 업로드된다.)
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String originalFileName = "";
		
		for(int i=1; i<=3; i++) {
		//업로드된 파일의 정보를 추출해보자
			originalFileName = multipartRequest.getOriginalFileName("fName"+i); //업로드한 파일명
			String filesystemName = multipartRequest.getFilesystemName("fName"+i);
		
			System.out.println("원본 파일명 : " + originalFileName);
			System.out.println("서버 경로 : " + realPath); 
			System.out.println("서버에 저장된 파일명 : " + filesystemName);
		}
		
		if(!originalFileName.equals("")) {
			request.setAttribute("msg", "파일이 업로드 되었습니다.");
		}
		else {
			request.setAttribute("msg", "파일 업로드 실패");
		}
		request.setAttribute("url", request.getContextPath()+"/pdstest/FileUpLoad2.st");
		
	}
}
