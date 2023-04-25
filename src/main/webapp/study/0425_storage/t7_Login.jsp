<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>t6_Login</title>
		<jsp:include page="/include/bs4.jsp" />
		<style>
			h2 {text-align:center;}
			.container {width : 500px;}
			.btn {width : 100%; margin-top:10px;}
			.saver {margin-top : 10px;}
		</style>
	</head>
	<body>
		<p><br/><p>
		<div class="container">
			<form name="myform" method="post" action="<%=request.getContextPath()%>/t0424/T7_LoginOk">
      <h2>로 그 인</h2>
      <div class="input-box">
        <div class="id-box">
          <div class="mid">아이디</div>
          <input type="text" class="form-control" id="mid" name="mid" placeholder="아이디">
        </div>
        <div class="pwd-box">
          <div class="pwd1">비밀번호</div>
          <input type="password" id="pwd" name="pwd" placeholder="비밀번호" class="form-control">
        </div>
      </div>
      <input type="checkbox" name="idSaver" value="1" class="saver"/> 아이디 저장
      <input type="submit" value="로그인" class="btn btn-success" />
      </form>
		</div>
		<p><br/><p>
	</body>
</html>