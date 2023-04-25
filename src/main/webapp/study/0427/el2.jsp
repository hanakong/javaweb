<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	

%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>el2</title>
		<jsp:include page="/include/bs4.jsp" />
	</head>
	<body>
		<p><br/><p>
		<div class="container">
			<h2>폼을 통해 넘어온 값 처리</h2>
			<p>
				취미 : ${hobbys}<br/>
				${hobby[0]} / ${hobbys[1]}
			</p>
			<hr/>
			<p><a href="${pageContext.request.contextPath}/study/0427/form2.jsp">돌아가기</a></p>
	</div>
		<p><br/><p>
	</body>
</html>