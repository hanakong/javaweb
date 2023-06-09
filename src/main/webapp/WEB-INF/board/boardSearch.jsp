<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<script type="text/javascript">
	'use strict';
	
	function pageCheck() {
		let pageSize = document.getElementById("pageSize").value;
		location.href = "${ctp}/BoardList.bo?page=${pag}&pageSize="+pageSize;
	}
	
	function searchCheck() {
		let searchString = $("#searchString").val();
		
		if(searchString.trim() == "") {
			alert("찾고자하는 검색어를 입력하세요!");
			searchForm.searchString.focus();
		}
		else {
			searchForm.submit();
		}
	}
</script>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>boardList</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
	<p><br/><p>
	<div class="container">
		<h2 class="text-center">게시판 조건 검색 리스트</h2>
		<div class="text-center">
			(<font color="blue">${searchTitle}</font>(으)로 <font color="blue">${searchString}</font>(을)를 검색한 결과 <font color="blue">${searchCount}</font>건이 검색되었습니다.)
		</div>
		<br/>
		<table class="table table-borderless m-0 p-0">
			<tr>
				<td><a href="${ctp}/BoardList.bo?page=${pag}&pageSize=${pageSize}" class="btn btn-warning">돌아가기</a></td>
			</tr>
		</table>
		<table class="table table-hover text-center">
			<tr class="table-dark text-dark" >
				<th>글번호</th>				
				<th>글제목</th>				
				<th>글쓴이</th>				
				<th>글쓴날짜</th>				
				<th>조회수</th>				
				<th>좋아요</th>				
			</tr>
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<tr>
					<td>${searchCount}</td>
					<td>
						<a href="${ctp}/BoardContent.bo?flag=search&search=${search}&searchString=${searchString}&idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}">${vo.title}</a>
						<c:if test="${vo.hour_diff <= 24}"><img src="${ctp}/images/new.png"/></c:if>
					</td>
					<td>${vo.nickName}</td>
					<td>
						<c:if test="${vo.hour_diff > 24}">${fn:substring(vo.wDate,0,16)}</c:if>
						<c:if test="${vo.hour_diff <= 24}">
							${vo.day_diff == 0 ? fn:substring(vo.wDate,11,16) : fn:substring(vo.wDate,0,16)}
						</c:if>
					</td>
					<td>${vo.readNum}</td>
					<td>${vo.good}</td>
				</tr>
				<c:set var="searchCount" value="${searchCount - 1}" />
			</c:forEach>
				<tr><td colspan="6" class="m-0 p-0"></td></tr>
		</table>
	</div>
	<p><br/><p>
	<jsp:include page="/include/footer.jsp" />
</body>
</html>