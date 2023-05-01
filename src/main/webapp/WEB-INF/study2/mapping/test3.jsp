<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>test</title>
		<jsp:include page="/include/bs4.jsp" />
	</head>
	<body>
	<jsp:include page="/include/header.jsp" />
		<p><br/><p>
		<div class="container">
			<h2>이곳은 test3 입니다.</h2>
			<p><img src="${ctp}/images/3.jpg" /></p>
			<a href="${ctp}/mapping/Test1" class="btn btn-success">1번으로 이동</a>	
			<a href = "${ctp}/mapping/Test2" class="btn btn-success">2번으로 가기</a>
			<a href = "${ctp}/mapping/Test4?su1=100&su2=50" class="btn btn-success">test4.jsp로 가기</a>
		</div>
		<jsp:include page="/include/footer.jsp" />
		<p><br/><p>
	</body>
</html>