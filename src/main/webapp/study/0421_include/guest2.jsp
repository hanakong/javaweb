<!-- guest.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>guest.jsp</title>
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
				<h2>이곳은 방명록입니다.</h2>
				<hr/>
				<p><img src="../../images/3.jpg" width="600px" /></p>
				<hr/>
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