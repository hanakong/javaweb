<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 요청하고 가져오면서 한글변환을 하지 않았기 때문에 깨지는 것 -->
<!-- 따라서 가져오기 전에 한글변환 설정을 해주면 오류 해결!! -->
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>test7</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
	</head>
	<body>
		<p><br/><p>
		<div class="container">
					
			성명 : <%=request.getParameter("name") %> <br/>	
			나이 : <%=request.getParameter("age") %> <br/>
			<p><a href="test7.jsp" class="btn btn-success mt-3">돌아가기</a></p>			
		</div>
		<p><br/><p>
	</body>
</html>