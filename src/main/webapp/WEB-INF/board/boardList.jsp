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
			<h2 class="text-center">게시판 리스트</h2>
			<table class="table table-borderless mb-0 p-0">
				<tr>
					<td>
						<select name="pageSize" id="pageSize" onchange="pageCheck()">
							<option <c:if test="${pageSize == 3}">selected</c:if>>3</option>				
							<option <c:if test="${pageSize == 5}">selected</c:if>>5</option>				
							<option <c:if test="${pageSize == 10}">selected</c:if>>10</option>				
							<option <c:if test="${pageSize == 15}">selected</c:if>>15</option>				
							<option <c:if test="${pageSize == 20}">selected</c:if>>20</option>				
						</select>건
					</td>
					<td style="text-align:right;">
						<!-- 첫 페이지 / 이전 페이지 / (현재 페이지번호/총페이지 수) / 다음 페이지 / 마지막 페이지 -->
						<c:if test="${pag > 1}">
							<a href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=1" title="첫 페이지로">◁◁</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${pag-1}" title="이전 페이지로">◁</a>
						</c:if>
						${pag}/${totPage}
						<c:if test="${pag < totPage}">
							<a href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${pag+1}" title="다음 페이지로">▷</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${totPage}" title="마지막 페이지로">▷▷</a>
						</c:if>
					</td>
				</tr>
			</table>
			<table class="table table-borderless">
				<tr>
					<td><a href="${ctp}/BoardInput.bo" class="btn btn-primary btn-sm">글쓰기</a></td>
					<td>
						<!-- 한페이지 분량 처리 -->
					</td>
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
						<td>${vo.idx}</td>
						<td>
							<a href="${ctp}/BoardContent.bo?idx=${vo.idx}">${vo.title}</a>
							<c:if test="${vo.hour_diff <= 24}"><img src="${ctp}/images/new.png"/></c:if>
						</td>
						<td>${vo.nickName}</td>
						<td>
							<!-- 1일(24시간) 이내는 시간만 표시, 이후는 날짜와 시간을 표시 -->
							<c:if test="${vo.hour_diff > 24}">${fn:substring(vo.wDate,0,16)}</c:if>
							<c:if test="${vo.hour_diff <= 24}">
									${vo.day_diff == 0 ? fn:substring(vo.wDate,11,16) : fn:substring(vo.wDate,0,16)}
							</c:if>
						</td>
						<td>${vo.readNum}</td>
						<td>${vo.good}</td>
					</tr>
				</c:forEach>
					<tr><td colspan="6" class="m-0 p-0"></td></tr>
			</table>
			<br/>
			<!-- 블록 페이징 처리 -->
			<div class="text-center">
				<ul class="pagination justify-content-center" style="margin:20px 0">
					<c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=1">첫 페이지로</a></li></c:if>
					<c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${(curBlock-1) * blockSize + 1}">이전 블록</a></li></c:if>
					<c:forEach var="i" begin="${curBlock*blockSize+1}" end="${curBlock*blockSize + blockSize}" varStatus="st">
						<c:if test="${i <= totPage && pag == i}"><li class="page-item active"><a class="page-link text-white bg-secondary border-secondary" href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
						<c:if test="${i <= totPage && pag != i}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
					</c:forEach>
						<c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${(curBlock+1) * blockSize + 1}">다음 블록</a></li></c:if>
						<c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${totPage}">마지막 페이지로</a></li></c:if>
				</ul>
			</div>
		</div>
		<p><br/><p>
		<jsp:include page="/include/footer.jsp" />
	</body>
</html>