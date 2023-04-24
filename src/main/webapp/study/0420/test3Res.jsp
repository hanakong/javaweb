<!-- test3Res.jsp -->
<!-- test3OK.java의 뷰 부분을 담당 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String name = request.getParameter("name");
%>
<script>
	alert('<%=name%>님의 자료가 저장되었습니다.');
	location.href = '<%=request.getContextPath()%>/study/0420/test3.jsp';
</script>
		