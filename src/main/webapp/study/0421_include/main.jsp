<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String sw = request.getParameter("sw")==null? "" : request.getParameter("sw"); 
	String member = request.getParameter("member")==null? "" : request.getParameter("member"); 
	
	if(member.equals("OK")) member = "정회원";
	else member = "비회원";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>main.jsp</title>
		<jsp:include page="/include/bs4.jsp"></jsp:include>
		<!-- jsp 액션태그 안의 /는 conetextpath명으로 간주된다. -->
	</head>
	<body>
		<!-- 헤더영역(로고/메뉴)를 표시할 때 사용 -->
		<div id="header" class="text-center" style="background-color:skyblue;">
			<%-- <%@ include file="menu.jsp" %> --%>
			<jsp:include page="/study/0421_include/menu.jsp" />
		</div>
		<div class="container">
		<br/>			
			<!-- 본문영역 -->
			<div id="content" class="text-center">
<% if(sw.equals("guest")) { %>
			<%@ include file="guest.jsp" %>
<% } else if(sw.equals("board")) { %>
			<%@ include file="board.jsp" %>
<% } else if(sw.equals("pds")) { %>
			<%@ include file="pds.jsp" %>
<% } else if(sw.equals("schedule")) { %>
			<%@ include file="schedule.jsp" %>
<% } else if(sw.equals("login")) { %>
			<%@ include file="login.jsp" %>
<% } else { %>
		<h2>이곳은 메인입니다.(<%=member%>)</h2>
		<hr/>
		<p><img src="../../images/2.jpg" width="600px" /></p>
		<hr/>
<% } %>
			</div>
			<p><br/><p>
			<!-- footer영역 : copyright/주소/소속/이메일/작성자....등등... -->
			<div id="footer">
				<%@ include file="footer.jsp" %>
			</div>
		</div>
		<p><br/><p>
	</body>
</html>