package pds;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PdsTotalDownCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		PdsDAO dao = new PdsDAO();
		PdsVO vo = dao.getIdxSearch(idx);
		
		String[] fNames = vo.getfName().split("/");
		String[] fSNames = vo.getfSName().split("/");

		//파일 압축에 필요한 객체들 선언
		FileInputStream fis = null;
		FileOutputStream fos = null;
		ZipOutputStream zos = null;
		ServletOutputStream sos = null;
		
		String realPath = request.getServletContext().getRealPath("/images/pds/");
		String zipPath = request.getServletContext().getRealPath("/images/pds/temp/");
		String zipName = vo.getTitle() + ".zip";
		
		 fos = new FileOutputStream(zipPath + zipName); // 껍데기
		 zos = new ZipOutputStream(fos);
		 
		 byte[] b = new byte[2048];
		 int data = 0;
		 
		 for(int i=0;i<fNames.length;i++) {
			 File file = new File(realPath + fSNames[i]);
			 
			 fis = new FileInputStream(file);
			 zos.putNextEntry(new ZipEntry(fNames[i])); //공간을 만들어줌 
			 
			 while((data = fis.read(b,0,b.length)) != -1) { //채우는 과정
				 zos.write(b,0,data);
			 }
			 zos.flush();
			 
			 zos.closeEntry();
			 fis.close();
		 }
		 zos.close();
		 
		 // 서버에서 압축작업이 완료되면, 압축파일을 클라이언트로 전송하고, 서버에 존재하는 압축파일을 삭제한다.
		 String mimeType = request.getServletContext().getMimeType(zipName.toString());
		 if(mimeType == null) {
			 response.setContentType("application/octet-stream");
		 }
		 String downLoadName = "";
		 if(request.getHeader("user-agent").indexOf("MSIE") == -1) {
			 downLoadName = new String(zipName.getBytes("UTF-8"), "8859_1");
		 }
		 else {
			 downLoadName = new String(zipName.getBytes("EUC-KR"), "8859_1");
		 }
		 response.setHeader("Content-Disposition", "attachment;filename="+downLoadName);
		 
		 fis = new FileInputStream(zipPath + zipName); //서버에 들어있는 것을 읽으면 inputStream
		 sos = response.getOutputStream(); // 클라이언트에게 outputStream
		 
		 while((data = fis.read(b, 0, b.length)) != -1) {
			 sos.write(b, 0, data);
		 }
		 sos.flush();
		 
		 sos.close();
		 fis.close();
		 // 클라이언트로 전송완료
		 
		 //서버에 존재하는 zip파일 삭제처리한다.
		 new File(zipName + zipName).delete();
		 
		 // 다운로드 횟수를 증가
		 dao.setPdsDownNumCheck(idx);
	}
}
