<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>jstl3</title>
		<jsp:include page="/include/bs4.jsp" />
	</head>
	<body>
		<p><br/><p>
		<div class="container">
			<h2>Function 라이브러리</h2>
			<pre>
사용법 : $ { fn:함수명(변수 / 값 ) }
관계연산자 : ==(eq), < (lt), > (gt), // >= (ge), <= (le) 뒤 2개는 버전에 따라 가능여부 결정
			</pre>
<%
//											  1         2
//	  					 0123457890123456789012
	String atom = "Welcome to My Homepage";
	String atom2 = "Welcome to My Homepage";
	pageContext.setAttribute("atom", atom);
	pageContext.setAttribute("atom2", atom2);
	
	String[] hobbys = {"등산","낚시","수영","바둑","싸이클","독서"};
	pageContext.setAttribute("hobbys", hobbys);
%>			
		<p>
			atom변수의 값 ${atom}<br/>
			1.atom 변수 값의 길이 : <%=atom.length() %> / ${fn:length(atom)}<br/>
			2.hobbys 변수 값의 길이 : <%=hobbys.length %> / ${fn:length(hobbys)}<br/>
			3.대문자변환(toUpperCase()) : <%=atom.toUpperCase() %> / ${fn:toUpperCase(atom)}<br/>
			3-1.소문자변환(toLowerCase()) : <%=atom.toLowerCase() %> / ${fn:toLowerCase(atom)}<br/>
			4-1.문자열추출(substring()) : <%=atom.substring(0,3) %> / ${fn:substring(atom,0,3)}<br/><!-- el에서의 substring은 시작과 끝을 반드시 지정해줘야한다.  -->
			4-2.문자열추출(substring()) : <%=atom.substring(2,5) %> / ${fn:substring(atom,2,5)}<br/>
			4-3.문자열추출(substring()) : 1. <%=atom.substring(2) %> / 2. ${fn:substring(atom,2,fn:length(atom))} / 3. ${fn:substring(atom,2,-1)}<br/>
			5-1.특정문자열의 위치값 검색(indexOf()) : <%=atom.indexOf("o") %> / ${fn:indexOf(atom, 'o')}<br/> <!-- el표기법 괄호안에 ""는 사용할 수 없다 -->
			5-2.특정문자열의 위치값 검색(indexOf()) : <%=atom.lastIndexOf("o") %> / ${fn:indexOf(atom, 'o')}<br/>
				atom 변수에 기억되어 있는 'o'문자의 위치를 모두 출력해보자.<br/>
				'o'의 위치는 =>
			<c:set var="cnt" value="0"></c:set>
			<c:forEach var="i" begin="0" end="${fn:length(atom)-1}" >
				<c:if test="${fn:substring(atom, i,i+1) == 'o'}">
					<c:set var="cnt" value="${cnt+1}" />
					${cnt}. &nbsp;${i}  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</c:if>			
			</c:forEach>
			<br/>
			atom변수값의 'o' 문자 개수는 ${cnt}개가 있습니다.
			<br/>
			6.문자열 추출(substringBefore() / substringAfter())<br/>
				문자 'o' 앞의 문자열 출력 substringBefore() : ${fn:substringBefore(atom,'o')}<br/>
				문자 'o' 뒤의 문자열 출력 substringAfter() : ${fn:substringAfter(atom,'o')}<br/>
			7.문자열분리(split(변수,분리할문자)) : 문자분리 후에는 분리된 문자들을 변수에 담아줘야한다.<br/>
				예) atom변수의 문자 중 'o'문자를 기준으로 분리해보세요<br/>
				<c:set var="atoms" value="${fn:split(atom,'o')}" />
				<c:forEach var="atom" items="${atoms}" varStatus="st">
					${st.count}. ${atom} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				</c:forEach>
				<br/>
				atom 안에 입력된 'o'문자의 갯수는? ${fn:length(atoms)-1}<br/>
			8.문자열 치환(replace())<br/>
				예) atom변수의 "My"를 "Your"로 변경하세요
				<%=atom.replace("My","Your") %> / <c:set var="temp" value="${fn:replace(atom2, 'My', 'Your')}"/> ${atom2}<br/>
			8-2.문자열 치환																		
				예) atom변수의 'o'를 "O"로 변경하시오<br/>
				<%=atom.replace("o","O") %> / ${fn:replace(atom2,'o','O')}<br/>
			9.특정문자(열) 포함유무 contains()<br/>
				예) atom2변수에 'o'를 포함하고 있는가? ${fn:contains(atom2,'o')}<br/>
				예) atom2변수에 'My'를 포함하고 있는가? ${fn:contains(atom2,'My')}<br/>
				예) atom2변수에 'Your'를 포함하고 있는가? ${fn:contains(atom2,'Your')}<br/>
		</p>
		</div>
		<p><br/><p>
	</body>
</html>