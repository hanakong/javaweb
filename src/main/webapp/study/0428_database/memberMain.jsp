<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 3@@@ -->
	<jsp:include page="/include/memberCheck.jsp" />
<!-- 3@@@ -->
<!-- 4### -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- 4### -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>memberMain</title>
		<jsp:include page="/include/bs4.jsp" />
	</head>
	<body>
		<p><br/><p>
		<div class="container">
			<h2>회원 전용방</h2>
			<p>현재 ${sMid}(${sName})님 로그인 중이십니다.</p> <!-- 2!!! -->
			<hr/>
			<!-- 4### //로그인 후에 나오는 페이지이기 때문에 로그인OK에서 처리해야함     //  7&&& 오늘 방문 횟수 --> 
			<p>보유 포인트 : ${sPoint} / 최종 접속일 ${fn:substring(sLastDate,0,16)} / 오늘 방문 횟수 : ${sTodayCount}</p>
			<!-- 4### -->
			<p><img src="${ctp}/images/2.jpg" width="300px" /></p>
			<hr/>
			<div>
				<a href="${ctp}/database/Logout" class="btn btn-warning">로그아웃</a>
			</div>
		</div>
		<p><br/><p>
	</body>
</html>