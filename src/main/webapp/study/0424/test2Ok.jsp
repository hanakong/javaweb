<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- JSTL을 사용해봅시다 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="vo" class="study.t0424.Test1VO" /> 
<jsp:setProperty property="*" name="vo"/>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>test2Ok</title>
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
        <!-- 이렇게 쓰면 프론트가 싫어함 -->
          <td><%=vo.getName()%></td>
          <td><%=vo.getAge()%></td>
          <td><%=vo.getGender()%></td>
          <td><%=vo.getJob()%></td>
          <td><%=vo.getAddress()%></td>
        </tr>
      </table>
      <p>
      	<a href="test2.jsp" class="btn btn-warning">돌아가기</a>
      </p>
    </div>
		</div>
		<p><br/><p>
	</body>
</html>