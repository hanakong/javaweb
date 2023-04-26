<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	for(int i=0; i<cookies.length; i++) {
		if(cookies[i].getName().equals("cMid")) {
			response.addCookie(cookies[i]);
		}
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>t6_member</title>
		<jsp:include page="/include/bs4.jsp" />
	</head>
	<body>
		<p><br/><p>
		<div class="container">
			<h2>이곳은 회원방입니다.</h2>
			<hr/>
				로그인 중	
			<hr/>
			<p><a href="<%=request.getContextPath()%>/t0424/T7_LogOut" class="btn btn-danger">로그아웃</a></p>					
		</div>
		<p><br/><p>
	</body>
</html>