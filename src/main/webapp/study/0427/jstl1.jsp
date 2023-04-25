<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>jstl1</title>
		<jsp:include page="/include/bs4.jsp" />
	</head>
	<body>
		<p><br/><p>
		<div class="container">
			<h2>JSTL(Java Standard Tag Library)</h2>
			<table class="table table-border table-hover">
				<tr class="table-dark text-dark">
					<th>라이브러리명</th>
					<th>주소(url)</th>
					<th>접두어</th>
					<th>기본문법</th>
				</tr>
				<tr>
					<td>Core</td>
					<td>http://java.sun.com/jsp/jstl/core</td>
					<td>c</td>
					<td>< c : 태그명 ></td>
				</tr>
				<tr>
					<td>Formatting</td>
					<td>http://java.sun.com/jsp/jstl/fmt</td>
					<td>fmt</td>
					<td>< fmt : 태그명 ></td>
				</tr>
				<tr>
					<td>Function</td>
					<td>http://java.sun.com/jsp/jstl/function</td>
					<td>fn</td>
					<td>$ { fn : 태그명 }***el표기 사용</td>
				</tr>
				<tr>
					<td>SQL</td>
					<td>http://java.sun.com/jsp/jstl/sql</td>
					<td>sql</td>
					<td>< sql : 태그명 ></td>
				</tr>
				<tr><td colspan="4" class="m-0 p-0"></td></tr>
			</table>
			<p><b>라이브러리를 사용할 경우는 상단에 jsp지시자(taglib)를 이용하여 선언한 후에 사용할 수 있다.</b></p>
			<br/><hr/><hr/>
			<h3>Core라이브러리 : 변수제어(선언/할당/출력/제거), 제어문(조건,반복문)-제어문 안의 변수로 활용</h3>
			<pre>
				변수 선언 : < c : set var="변수명" value="값" />
				변수 출력 : < c : out value="$ {변수명}" /> ==>out은 있는 그대로의 출력이므로 변수의 값을 표현하기 위해선 EL표기법을 사용한다.
				변수 제거 : < c : remove var="변수명" /> 		 
			</pre>
			<p> 사용 예:<br/>
				su1변수를 선언 후 초기값으로 100을 할당 <c:set var="su1" value="100" /><br/>			
				su1변수 출력 <c:out value="${su1}" /><br/>
				su1변수 제거 <c:remove var="su1" /><br/>
				su1변수의 값에 100을 더하여 su2변수에 할당 후 출력 <c:set var="su2" value="${su1+100}" /><br/>
				su2값 출력 <c:out value="${su2}" /><br/>
				< c : out 은 el 변수로 대체할 수 있다 > <%-- ${su2} --%> <br/>
			</p>
			<hr/>
			<h4>JSTL 제어문(core라이브러리를 활용)</h4>
			<p>사용법 : < c : if test="$ {조건식}" > 조건식의 내용이 참일 때 수행(지금 이자리)
			-->jstl엔 else가 없음(상반된 조건을 2번 써야함) < /c : if ></p>
			<div>일반적인 비교연산 수행시는 '문자로 비교'한다.</div>
			<div>따라서 숫자로 비교연산을 하고 싶다면 '숫자로 변환(문자변수+0) 후에 비교'해야한다.</div>
			<div>예제 : su3 = 100, su4 = 200을 기억 후 두 값을 비교해보자<br/></div>
			<c:set var="su3" value="100" />
			<c:set var="su4" value="20" />
				1-1. su3 == su4 : <c:if test="${su3 == su4}">su3와 su4는 같다.</c:if><br/>
				1-2. su3 != su4 : <c:if test="${su3 != su4}">su3와 su4는 같지 않다.</c:if><br/>
				2-1. su3 > su4 : <c:if test="${su3 > su4}">su3가 su4보다 크다.</c:if><br/>
				2-2. su3 < su4 : <c:if test="${su3 < su4}">su3가 su4보다 작다.</c:if><br/>
				
				3-1. su3 > su4 : <c:if test="${su3+0 < su4+0}">su3는 su4보다 크다.</c:if>
				3-2. su3 <= su4 : <c:if test="${su3+0 <= su4+0}">su3는 su4보다 크지않다.</c:if>
			<div>
				예제 : URL에 jumsu를 입력받아서 학점을 구하시오.<br/>
				<c:set var="jumsu" value="${param.jumsu}"></c:set>
				<c:if test="${jumsu+0 < 60}"><c:set var="grade" value="F" /></c:if><br/>
				<c:if test="${jumsu+0 >= 60}"><c:set var="grade" value="D" /></c:if><br/>
				<c:if test="${jumsu+0 >= 70}"><c:set var="grade" value="C" /></c:if><br/>
				<c:if test="${jumsu+0 >= 80}"><c:set var="grade" value="B" /></c:if><br/>
				<c:if test="${jumsu+0 >= 90}"><c:set var="grade" value="A" /></c:if><br/>
			</div>
				학점은 : ${grade}
			<hr/>
			<h3>다중조건비교 : choose ~ when</h3>
			<pre>
				사용법 : 
				< c : choose>
					< c : when test="조건식1">수행할내용1</ c :when>
					< c : when test="조건식2">수행할내용2</ c :when>
					< c : when test="조건식3">수행할내용3</ c :when>
					< c : when test="조건식4">수행할내용4</ c :when>
					~~~~~~~~~~~~
					< c : otherwise>기타수행할내용< / : otherwise>
				< / c : choose>	
			</pre>
			<br/>학점은?
				<c:choose>
					<c:when test="${jumsu+0 >= 90}">A</c:when>
					<c:when test="${jumsu+0 >= 80}">B</c:when>
					<c:when test="${jumsu+0 >= 70}">C</c:when>
					<c:when test="${jumsu+0 >= 60}">D</c:when>
					<c:otherwise>F</c:otherwise>
				</c:choose>
			</div>
		<p><br/><p>
	</body>
</html>