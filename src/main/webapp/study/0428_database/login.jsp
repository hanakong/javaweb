<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>login.jsp</title>
		<jsp:include page="/include/bs4.jsp" />
	</head>
	<body>
		<div class="container">
		<jsp:include page="/include/header.jsp" />
			<form name="myform" action="${ctp}/database/LoginOk"> <!-- database라고 만들었다고 database가 필요한 것이 아니다 -->
				<table class="table table-bordered text-center">
					<tr>
						<td colspan="2"><font size="5">로 그 인</font></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="mid" autofocus required class="form-control" /></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="pwd" required class="form-control" /></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="로그인" class="btn btn-success mr-2" />
							<input type="reset" value="다시입력" class="btn btn-warning mr-2" />
							<input type="button" value="회원가입" onclick="location.href='join.jsp';" class="btn btn-success" />
						</td>
					</tr>
				</table>
			</form>
		</div>
		<jsp:include page="/include/footer.jsp" />
		<p><br/><p>
	</body>
</html>