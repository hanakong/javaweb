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
			<h2>이곳은 /WEB-INF/study2/mapping/test1.jsp</h2><!-- 보안이 되있는 폴더이기때문에 url로 들어갈 수 없다. -->
			<!-- controller를 통해서만 접근할 수 있다. -->
			<!-- <h2>이곳은 \\WEB-INF\\study2\\mapping\\test1.jsp</h2> --> <!-- DOS에선 역슬래시를 경로로 -->
			<div>
				<div>두 수의 합 : ${hap}</div>
				<div>두 수의 합 : ${cha}</div>
			</div>
			<p><img src="${ctp}/images/1.jpg" /></p>
			<p>
				<a href = "${ctp}/mapping/Test2" class="btn btn-success">test2.jsp로 가기</a><!-- 같은 폴더에 있음에도 갈 수 없다. controller를 통해서 가야함... -->
				<a href = "${ctp}/mapping/Test3" class="btn btn-success">test3.jsp로 가기</a>
				<a href = "${ctp}/mapping/Test4?su1=100&su2=50" class="btn btn-success">test4.jsp로 가기</a>
			</p>
		</div>
		<p><br/><p>
		<jsp:include page="/include/footer.jsp" />
	</body>
</html>