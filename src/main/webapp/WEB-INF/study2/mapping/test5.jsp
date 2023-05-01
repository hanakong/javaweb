<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>test5</title>
		<jsp:include page="/include/bs4.jsp" />
		<style>
			.su-container {
			width : 500px;
			}
		</style>
	</head>
	<body>
	<jsp:include page="/include/header.jsp" />
		<p><br/><p>
		<div class="container">
			<h2>Test5입니다.</h2>
			<p><img src="${ctp}/images/5.jpg" /></p>
			<p>
				<a href="${ctp}/mapping/Test5_2.do" class="btn btn-success">test5_2 호출</a>
				<a href="${ctp}/mapping/Test5_3.do" class="btn btn-success">test5_3 호출</a>
				<a href="${ctp}/mapping/Test5_4.do" class="btn btn-success">test5_4 호출</a>
				<a href="${ctp}/mapping/Test5_5.do" class="btn btn-success">test5_5 호출</a>
			</p>
			<hr/>
			<div class="su-container">
				<form name="myform" metod="post" action="${ctp}/Test5_5.do">
					<div>
						첫번째 수 : <input type="number" name="su1" value="1" class="form-control" />
					</div>
					<div>
						연산자 :
						 <select name="op" class="form-control">
						 	<option selected>+</option>
						 	<option>-</option>
						 	<option>*</option>
						 	<option>/</option>
						 	<option>%</option>
						</select>
					</div>
					<div>
						두번째 수 : <input type="number" name="su2" value="1" class="form-control" />
					</div>
					<br/>
					<div>
						<input type="submit" value="계산" class="form-control btn btn-primary" />
					</div>
				</form>
			</div>
		</div>
		<p><br/><p>
		<jsp:include page="/include/footer.jsp" />
	</body>
</html>