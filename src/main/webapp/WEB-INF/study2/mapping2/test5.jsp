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
		<script>
			'use strict';
			
			function gugudan() {
				let dan = document.getElementById("dan").value;
				location.href = "${ctp}/Test5_3.mi?dan="+dan;
			}
		</script>
	</head>
	<body>
	<jsp:include page="/include/header.jsp" />
		<p><br/><p>
		<div class="container">
			<h2>Test5입니다.</h2>
			<p><img src="${ctp}/images/5.jpg" /></p>
			<p>
				<a href="${ctp}/mapping2/Test5_2.mi" class="btn btn-success">test5_2 호출</a>
				<a href="${ctp}/mapping2/Test5_3.mi" class="btn btn-success">test5_3 호출</a>
				<a href="${ctp}/mapping2/Test5_4.mi" class="btn btn-success">test5_4 호출</a>
				<a href="${ctp}/mapping2/Test5_5.mi" class="btn btn-success">test5_5 호출</a>
			</p>
			<hr/>
			<div class="su-container">
				<form name="myform" metod="post" action="${ctp}/Test5_5.mi">
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
				<hr/>
			<div>
				출력할 단을 입력하세요 
				<input type="number" name="dan" id="dan" value="2" class="form-control" />
				<input type="button" value="구구단 출력(5_3에서 출력)" onclick="gugudan()" class="btn btn-success" />
			</div>
				<hr/>
		</div>
		<p><br/><p>
		<jsp:include page="/include/footer.jsp" />
	</body>
</html>