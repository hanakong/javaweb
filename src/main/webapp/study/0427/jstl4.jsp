<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>test</title>
		<jsp:include page="/include/bs4.jsp" />
	</head>
	<body>
		<p><br/><p>
		<div class="container">
			<h2>Format 라이브러리</h2>
			<pre>
사용용도 : 형식문자열을 지정할때 사용한다. (쉼표, 화폐단위, 백분율)
사용법 : < fmt : 명령어 value="$ {값 / 변수 }" pattern="표현패턴" type="화폐단위" />			
			</pre>
<%
	int won = 7654321;
	double won2 = 7654.321;
	pageContext.setAttribute("won", won);
	pageContext.setAttribute("won2", won2);
%>
			<div>
				1-1. 천단위 쉼표표시<br/><br/>
					1234567 = <fmt:formatNumber value="1234567" /><br/> 
					7654321 = <fmt:formatNumber value="${won}" /><br/>
					7654.321 = <fmt:formatNumber value="${won2}" /><br/> 
					7654.321 = <fmt:formatNumber value="${won2}" pattern="0,000,000.0000" /><br/> <!-- 패턴을 적어주면 적어준 그대로 표현되기 때문에 조심해야한다. -->
					7654.321 = <fmt:formatNumber value="${won2}" pattern="#,##0.0" /><br/> <!-- # 을 통해 의미가 없는 숫자는 표시하지 마세요를 알려줌. -->
				<br/>1-2. 화폐단위<br/><br/>
					7654321 (원화) = <fmt:formatNumber value="${won}" type="currency" /><br/>
					7654321 (달러) = <fmt:formatNumber value="${won}" type="currency" currencyCode="USD" /><br/>
				<br/>1-3. 백분율<br/><br/>
					<c:set var="su1" value="0.9456" />
					su1 = <fmt:formatNumber value="${su1}" /><br/>
					94.56(반올림) 95% = <fmt:formatNumber value="${su1}" type="percent" /><br/>
				<br/>2. 날짜<br/><br/>
					<c:set var="today" value="<%=new Date()%>" />
					오늘 날짜 : ${today}<br/>
					<fmt:formatDate value="${today}"/><br/>
					<fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/><br/> <!-- mm은 시간의 '분'이 되므로 조심 -->
					<fmt:formatDate value="${today}" pattern="hh : mm : ss"/><br/> <!-- mm은 시간의 '분'이 되므로 조심 -->
					<fmt:formatDate value="${today}" pattern="yyyy년 MM월 dd일 hh시 mm분 ss초"/><br/> <!-- mm은 시간의 '분'이 되므로 조심 -->
				<br/>3. 국가별 설정(로케일)<br/><br/>
					톰캣서버의 기본 로케일 : <%=response.getLocale() %><br/>
					톰캣서버의 기본 로케일변경(미국식) : <fmt:setLocale value="en_US" />
																				<fmt:formatNumber value="${won2}" type="currency"/><br/>
				<hr/>기타<hr/>
				<br/>4. URL 이동 : location.href = '';<br/><br/>
					<%-- jstl3.jsp로 이동하기 : <c:redirect url="jstl3.jsp" /> --%>
				<br/>5. 절대경로 : <br/><br/>
					<img src="<%=request.getContextPath()%>/images/1.jpg" width="150px"/><br/>
					<img src="${ctp}/images/2.jpg" width="150px"/><br/>
				<br/>6. import : <br/><br/>
					<c:import url="/include/bs4.jsp" />
					
			</div>
		</div>
		<p><br/><p>
	</body>
</html>