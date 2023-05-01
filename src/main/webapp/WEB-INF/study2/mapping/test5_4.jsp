<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>test5_4</title>
		<jsp:include page="/include/bs4.jsp" />
	</head>
	<body>
	<jsp:include page="/include/header.jsp" />
		<p><br/><p>
		<div class="container">
			<h2>Test5_4입니다.</h2>
			<p><img src="${ctp}/images/1.jpg" /></p>
			<p>
				<a href="${ctp}/mapping/Test5.do" class="btn btn-success">test5 호출</a>
				<a href="${ctp}/mapping/Test5_2.do" class="btn btn-success">test5_2 호출</a>
				<a href="${ctp}/mapping/Test5_3.do" class="btn btn-success">test5_3 호출</a>
				<a href="${ctp}/mapping/Test5_5.do" class="btn btn-success">test5_5 호출</a>
			</p>
		</div>
		<p><br/><p>
		<jsp:include page="/include/footer.jsp" />
	</body>
</html>