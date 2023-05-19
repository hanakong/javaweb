<%@page import="member.MemberChatVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
	MemberDAO dao = new MemberDAO();
	ArrayList<MemberChatVO> vos = dao.getMemberMessage();
	pageContext.setAttribute("vos", vos);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>memberMessage</title>
		<jsp:include page="/include/bs4.jsp" />
		<script type="text/javascript">
			setTimeout("location.reload()" , 10000);
			
			$(document).ready(function(){
				document.body.scrollIntoView(false); //스크롤바를 강제로 body태그의 마지막으로 위치시켜준다. //본문을 읽어야 쓸 수 있다. 
			});
		</script>
	</head>
	<body>
		<div class="container mt-2">
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<c:if test="${sNickName == vo.nickName}"><font color="blue">${vo.nickName}</font> : ${vo.chat}<br/></c:if>
				<c:if test="${sNickName != vo.nickName}">${vo.nickName} : ${vo.chat}<br/></c:if>	
			</c:forEach>
		</div>
	</body>
</html>