<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- JSTL을 사용해봅시다 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- core,fmt,functions,sql을 많이 사용// 이중 앞 3개는 매우 자주 사용하니 알아둬야함 -->
<!-- 스크릿틀릿 대신에 jstl을 사용한다. -->
<!-- 앞에서 전송된 값들을 VO객체에 담아보자 -->
<!-- jsp에서 객체를 사용하기 위해선 해당 객체를 JSP action 태그(useBean)을 이용하여 생성해야한다. -->
<jsp:useBean id="vo" class="study.t0424.Test1VO" /> <!-- Atom atom(id) = new Atom()(class) -->

<!-- 서블릿에서는 getter와 setter를 이용하여 값을 불러오거나 저장시켜준다. -->
<!-- jsp에서는 getProperty와 setProperty를 이용하여 값을 불러오거나 저장시켜준다. -->
<%-- <jsp:setProperty property="name" value="name" name="vo"/> <!-- 원래 사용법 value=폼태그에서 넘어오는 name // property= vo의 변수 --> --%>
<jsp:setProperty property="name" name="vo"/> <!-- vo에 name을 저장시켜줄거야 -->
<jsp:setProperty property="age" name="vo"/>
<jsp:setProperty property="gender" name="vo"/>
<jsp:setProperty property="job" name="vo"/>
<jsp:setProperty property="address" name="vo"/>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>test2Ok4</title>
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
          <%-- <td>${name}</td> --%>
          <td><jsp:getProperty property="name" name="vo" /></td>
          <td>${age}</td>
          <td>${gender}</td>
          <td>${job}</td>
          <td>${address}</td>
        </tr>
      </table>
      <p>
      	<!-- <a href="test1.jsp">돌아가기</a> --> <!-- forward이므로 이렇게 돌아가기를 할 수 없음 -->
      	<%-- <a href="<%=request.getContextPath()%>/study/0424/test1.jsp" class="btn btn-warning">돌아가기</a> --%>
      	<a href="test25.jsp" class="btn btn-warning">돌아가기</a>
      </p>
    </div>
		</div>
		<p><br/><p>
	</body>
</html>