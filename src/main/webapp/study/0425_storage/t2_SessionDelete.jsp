<!-- t1_CookiesDelete.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session.invalidate(); //현재 브라우저에 저장된 모든 세션 삭제
%>
<script>
	alert("세션 삭제 완료");
	location.href = "t2_SessionMain.jsp";
</script>