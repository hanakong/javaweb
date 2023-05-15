package study2.pdstest;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class DownLoadCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdstest");
		
		String[] files = new File(realPath).list(); // 뒤에 list를 써서 여러개가 온다. 따라서 배열로 받는다.
		
		for(String file : files) {
			System.out.println("file : " + file);
		}
		request.setAttribute("files", files);
		request.setAttribute("fileCount", files.length);
	}
}