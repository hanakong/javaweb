<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>test1Res</title>
		<jsp:include page="/include/bs4.jsp" />
	</head>
	<style>
		.container {width : 700px ; text-align : center;}
		.tr1 {background-color : rgba(20, 20, 20, 0.4); color : white;}
	</style>
	<body>
		<p><br/><p>
		<div class="container">
			<h3>처리된 자료를 view에 출력시켜본다.</h3>
    <div>
      <table class="table table-bordered">
        <tr class="tr1">
          <td>성명</td>
          <td>나이</td>
          <td>성별</td>
          <td>직업</td>
          <td>주소</td>
        </tr>
        <tr>
          <td>${vo.name}</td>
          <td>${vo.age}</td>
          <td>${vo.gender}</td>
          <td>${vo.job}</td>
          <td>${vo.address}</td>
        </tr>
      </table>
      <p>
      	<!-- <a href="test1.jsp">돌아가기</a> --> <!-- forward이므로 이렇게 돌아가기를 할 수 없음 -->
      	<%-- <a href="<%=request.getContextPath()%>/study/0424/test1.jsp" class="btn btn-warning">돌아가기</a> --%>
      	<a href="${pageContext.request.contextPath}/study/0424/test1.jsp" class="btn btn-warning">돌아가기</a>
      </p>
    </div>
		</div>
		<p><br/><p>
	</body>
</html>