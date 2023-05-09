package study2.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import member.MemberDAO;
import member.MemberVO;

@SuppressWarnings("serial")
@WebServlet("/AjaxTest5")
public class AjaxTest5 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberMidCheck(mid);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("mid", vo.getMid());
		map.put("name", vo.getName());
		map.put("nickName", vo.getNickName());
		map.put("gender", vo.getGender());
		map.put("point", vo.getPoint()+"");
		
		JSONObject memberObj = new JSONObject(map);
		String str = memberObj.toJSONString();
		
		/* vos 객체를 만들어서 JSON 객체로 저장하여 넘겨주고자 할 경우는?
		  JSONArray jsonVOS = new JSONArray();
		  jsonVOS.add();
		*/
		JSONArray memberArray = new JSONArray();
		
		memberArray.add(memberObj);
		
		map = new HashMap<String, String>();
		map.put("mid", "아톰1234");
		map.put("name", "아톰맨");
		map.put("nickName", "아톰");
		map.put("gender", "중성");
		map.put("point", "10000");
		
		JSONObject memberObj2 = new JSONObject(map);
		memberArray.add(memberObj2);
		
		System.out.println("memberArray : " + memberArray);
		response.getWriter().write(memberArray.toString());
		
	}
}
