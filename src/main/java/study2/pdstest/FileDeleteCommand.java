package study2.pdstest;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class FileDeleteCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fName = request.getParameter("file") == null ? "" : request.getParameter("file");

		// 파일을 삭제하기 위한 경로 설정 과정 
		String realPath = request.getServletContext().getRealPath("/images/pdstest/");
		File file = new File(realPath + fName);
		
		// 삭제되었는지 여부를 확인하기 위한 res
		String res = "0";
		
		// 파일이 존재하는지 물어봄
		if(file.exists()) { 
			//존재한다면 삭제처리
			file.delete();
			res = "1";
		}
		response.getWriter().write(res);
	}
}
