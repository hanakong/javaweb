<!-- t2_SessionGroup.jsp -->
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/include/bs4.jsp" />
<p><br/></p>
<div class="container">
<%
	// String name = (String)session.getAttribute("sName");

	Enumeration names = session.getAttributeNames();
	
	while(names.hasMoreElements()) { //(~~~) : 안에 요소들이 있나요?
		String name = (String)names.nextElement(); // 있으면 다음줄의 요소를 name에 넣으세요
		out.println("세션명 : " + name + "<br/>");	
	}
%>
	<p>
		<a href = "t2_SessionMain.jsp" class="btn btn-success">돌아가기</a>
	</p>
</div>
