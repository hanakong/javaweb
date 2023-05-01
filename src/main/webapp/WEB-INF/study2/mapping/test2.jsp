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
			<h2>이곳은 test2.jsp입니다.</h2>	
			<p><img src="${ctp}/images/2.jpg" /></p>
			<p>
				<a href = "${ctp}/mapping/Test1" class="btn btn-success">test1.jsp로 가기</a><!-- 같은 폴더에 있음에도 갈 수 없다. controller를 통해서 가야함... -->
				<a href = "${ctp}/mapping/Test3" class="btn btn-success">test3.jsp로 가기</a>
				<a href = "${ctp}/mapping/Test4?su1=100&su2=50" class="btn btn-success">test4.jsp로 가기</a>
			</p>
		</div>
		<jsp:include page="/include/footer.jsp" />
		<p><br/><p>
	</body>
</html>