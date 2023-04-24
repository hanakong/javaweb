<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>t3_ApplicationMain</title>
		<jsp:include page="/include/bs4.jsp" />
	</head>
	<body>
		<p><br/><p>
		<div class="container">
			<h2>어플리케이션 연습 메인메뉴</h2> <!-- 어플리케이션의 생명주기는 서버와 관련이 있다 -->
			<!-- 초기실행값 관련 // 관리자 외엔 거의 사용하지 않음 -->
			<form name="myform" method="post" action="t3_ApplicationSave.jsp">
				<div>
					아이디 : 
					<input type="text" name="mid" value="${aMid}" autofocus class="form-control" />
				</div>
				<div>
					닉네임 :
					<input type="text" name="nickName" value="${aNickName}" class="form-control" />
				</div>
				<div>
					이름 : 
					<input type="text" name="name" value="${aName}" class="form-control" />
				</div>
				<div>
					<%-- 세션 ID : <%=application.%> <!-- 새로운 브라우저를 켤때마다 달라져요 --> --%>
				</div>
				<div class="row">
					<div class="col"><a href="t3_ApplicationSave.jsp" class="btn btn-success form-control">어플리케이션 저장(Get)</a></div>
					<div class="col"><button type="submit" class="btn btn-success form-control">어플리케이션 저장(Post)</button></div>
				</div>
			</form>
		</div>
		<p><br/><p>
	</body>
</html>