<!-- test6Ok.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String[] hobbys = request.getParameterValues("hobby");

	String strHobby = "";
	for(String hobby : hobbys) {
		strHobby += hobby + "/";
	}
	strHobby = strHobby.substring(0, strHobby.length()-1);
%>
<p>전송된 값....</p>
<p>성명 : <%=request.getParameter("name")%></p> <%-- 표현식은 세미콜론을 붙이지 않아요~ --%>
<p>나이 : <%=request.getParameter("age")%></p>
<p>성별 : <%=request.getParameter("gender")%></p>
<p>취미 : <%=strHobby%></p>
<p>호스트IP : <%=request.getParameter("hostIP")%></p>
<p>전송방식 : <%=request.getParameter("name")%></p>
<p>접속 URL : <%=request.getRequestURL()%></p>
<p>접속 URI : <%=request.getRequestURI()%></p>
<p>접속 서버이름 : <%=request.getServerName()%></p>
<p>접속 서버포트 : <%=request.getServerPort()%></p>
<p>접속 Context명 : <%=request.getContextPath()%></p>
<p>접속 프로토콜 : <%=request.getProtocol()%></p>
<!-- <p><input type="button" value="돌아가기" onclick="location.href='test6.jsp'"/></p> -->
<p><input type="button" value="돌아가기" onclick="history.back()"/></p>
 <!-- 뒤로가기 자바스크립트 명령어(위험 그래서 잘 사용 안함) -->
 <!-- 대표적으로 데이터베이스에 저장할 때 -->