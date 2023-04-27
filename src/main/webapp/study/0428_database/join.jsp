<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>join.jsp</title>
		<jsp:include page="/include/bs4.jsp" />
		<style>
			th {
				background-color:#eee;
			}
		</style>
		<script>
			'use strict';
			
			fuction fCheck() {
				/* 폼의 내용을 가져와서 유효성 검사 ((아이디/비밀번호/성명 공백과 길이체크 길이는 모두 20자 이내( DB에 최대 20글자로 설정해놨기 때문에 ) */
			}
			
		</script>
	</head>
	<body>
		<p><br/><p>
		<div class="container">
			<h2>회원가입</h2>
			<form name="myform" method="post" action="${ctp}/database/JoinOk">
				<table class="table text-center">
					<tr>
						<th>아이디</th>					
						<td><input type="text" name="mid" id="mid" class="form-control" required /></td>
					</tr>
					<tr>
						<th>비밀번호</th>					
						<td><input type="password" name="pwd" id="pwd" class="form-control" required /></td>
					</tr>
					<tr>
						<th>성명</th>					
						<td><input type="text" name="name" class="form-control" required /></td>
					</tr>
					<tr>
						<td colspan="2" class="text-center">
							<input type="submit" value="회원가입" class="btn btn-success" /> <!-- 버튼으로 처리했다면 유효성검사를 반드시 해야한다 -->
							<input type="reset" value="다시입력" class="btn btn-danger" />
							<input type="button" value="돌아가기" onclick="location.href='${ctp}/study/0428_database/login.jsp'" class="btn btn-warning" />
							<!-- 회원가입 실패시 왔다갔다한다? -->
							<!-- DB에 접근했다 왔기 때문에 경로가 섞인다 이로 인해 같은 경로에 있는 것이 아니라 다른 경로에 있기 때문에 절대경로로 지정해줘야한다. -->
						</td>
					</tr>
				</table>
			</form>		
		</div>
		<p><br/><p>
	</body>
</html>