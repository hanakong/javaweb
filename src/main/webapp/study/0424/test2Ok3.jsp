<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- JSTL을 사용해봅시다 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- core,fmt,functions,sql을 많이 사용// 이중 앞 3개는 매우 자주 사용하니 알아둬야함 -->
<!-- 스크릿틀릿 대신에 jstl을 사용한다. -->
<!-- 앞에서 전송된 값들을 jstl core lib를 통해 변수에 담아보자. -->

<c:set var="name" value="${param.name}" />
<c:set var="age" value="${param.age}" /> <!-- input 태그 안의 name의 값과 param . 뒤의 값이 일치해야한다 -->
<c:set var="gender" value="${param.gender}" />
<c:set var="job" value="${param.job}" />
<c:set var="address" value="${param.address}" />
<%-- <%
	jstl을 사용하지 않으면 아래와 같이 값을 받아와야한다.
	  
	String name = request.getParameter("name")==null ? "" : request.getParameter("name");
	int age = request.getParameter("age")==null ? 0 : Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender")==null ? "" : request.getParameter("gender");
	String job = request.getParameter("job")==null ? "" : request.getParameter("job");
	String address = request.getParameter("address")==null ? "" : request.getParameter("address");
	
/* 	pageContext.setAttribute("name", name);
	pageContext.setAttribute("age", age);
	pageContext.setAttribute("gender", gender);
	pageContext.setAttribute("job", job);
	pageContext.setAttribute("address", address); */
%> --%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>test2Ok3</title>
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
          <td>${name}</td>
          <td><c:out value="${age}" /></td> <!-- 표준 but 그냥 el표기로 씀 -->
          <%-- <td>${age}</td> --%>
          <td>${gender}</td>
          <td>${job}</td>
          <td>${address}</td>
        </tr>
      </table>
      <p>
      	<!-- <a href="test1.jsp">돌아가기</a> --> <!-- forward이므로 이렇게 돌아가기를 할 수 없음 -->
      	<%-- <a href="<%=request.getContextPath()%>/study/0424/test1.jsp" class="btn btn-warning">돌아가기</a> --%>
      	<a href="test23.jsp" class="btn btn-warning">돌아가기</a>
      </p>
    </div>
		</div>
		<p><br/><p>
	</body>
</html>