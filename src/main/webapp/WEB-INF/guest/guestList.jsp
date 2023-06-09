<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %> <!-- enter를 쳤을 때 줄바꿈이 되도록 처리하는 중 -->
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>guestList(부트스트랩 페이지네이션 적용)</title>
		<jsp:include page="/include/bs4.jsp" />
		<style>
			th {
				background-color : #eee;
				text-align : center;
			}
		</style>
		<script type="text/javascript">
			'use strict';
			
			function pageCheck() {
				let pageSize = document.getElementById("pageSize").value;
				location.href = "${ctp}/GuestList.gu?page=${pag}&pageSize="+pageSize;
			}
			
			function delCheck(idx) {
				let ans = confirm("선택하신 게시물을 삭제하시겠습니까?");
				if(ans) location.href = "${ctp}/GuestDelete.gu?idx="+idx;
			}
		</script>
	</head>
	<body>
	<jsp:include page="/include/header.jsp" />
		<p><br/><p>
		<div class="container">
			<h2 class="text-center">방명록 리스트</h2>
			<table class="table table-borderless mb-0 p-0">
				<tr>
					<td>
						<c:if test="${sAdmin != 'adminOk'}"><a href="${ctp}/AdminLogin.gu" class="btn btn-success btn-sm">관리자</a></c:if>
						<c:if test="${sAdmin == 'adminOk'}"><a href="${ctp}/AdminLogout.gu" class="btn btn-danger btn-sm">관리자 로그아웃</a></c:if>
					</td>
					<td style="text-align:right;"><a href="${ctp}/GuestInput.gu" class="btn btn-secondary btn-sm">글쓰기</a></td>
				</tr>
			</table>
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
							<a href="${ctp}/GuestList.gu?pageSize=${pageSize}&pag=1" title="첫 페이지로">◁◁</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="${ctp}/GuestList.gu?pageSize=${pageSize}&pag=${pag-1}" title="이전 페이지로">◁</a>
						</c:if>
						${pag}/${totPage}
						<c:if test="${pag < totPage}">
							<a href="${ctp}/GuestList.gu?pageSize=${pageSize}&pag=${pag+1}" title="다음 페이지로">▷</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="${ctp}/GuestList.gu?pageSize=${pageSize}&pag=${totPage}" title="마지막 페이지로">▷▷</a>
						</c:if>
					</td>
				</tr>
			</table>
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<table class="table table-borderless mb-0 mt-0">
					<tr>
						<td>
							번호 : ${curScrStartNo}
							<c:if test="${sAdmin == 'adminOk'}">
								<a href="javascript:delCheck(${vo.idx})" class="btn btn-danger">삭제</a>
							</c:if>						
						</td> <!-- 삭제되면 구멍이 뽕뽕 뚫리기 때문에 idx말고 다른 것 사용할 예정 -->
						<td style="text-align:right;">방문IP : ${vo.hostIP}</td>
					</tr>
				</table>
				<table class="table table-bordered mt-0">
					<tr>
						<th style="20%">성명</th>
						<td style="25%">${vo.name}</td>
						<th style="20%">방문일자</th>
						<td style="35%">${fn:substring(vo.visitDate,0,19)}</td>
					</tr>
					<tr>
						<th>메일주소</th>
						<td colspan="3">
							<c:if test="${empty vo.email || fn:length(vo.email)<5 || fn:indexOf(vo.email,'@')==-1 || fn:indexOf(vo.email,'.')==-1}">- 없음 -</c:if>
							<c:if test="${empty vo.email && fn:length(vo.email)>=5 && fn:indexOf(vo.email,'@')!=-1 || fn:indexOf(vo.email,'.')!=-1}">${vo.email}</c:if>
						</td>
					</tr>
					<tr>
						<th>홈페이지 주소</th>
						<td colspan="3">
						<c:if test="${empty vo.homePage || fn:length(vo.homePage)<10 || fn:indexOf(vo.homePage,'.')==-1}">- 없음 -</c:if>
						<c:if test="${empty vo.homePage && fn:length(vo.homePage)>=10 && fn:indexOf(vo.homePage,'.')!=-1}">${vo.homePage}</c:if>
						</td>
					</tr>
					<tr>
						<th>방문 후기</th>
						<td colspan="3" style="height:150px">${fn:replace(vo.content, newLine, '<br/>')}</td>
					</tr>
				</table>
				<c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
			</c:forEach>
			<br/>
			<!-- 첫 페이지로 / 이전 블록 / 1 2 3 / 다음 블록 / 마지막 페이지로 -->
			<div class="text-center">
				<ul class="pagination justify-content-center" style="margin:20px 0">
					<c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/GuestList.gu?pageSize=${pageSize}&pag=1">첫 페이지로</a></li></c:if>
					<c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/GuestList.gu?pageSize=${pageSize}&pag=${(curBlock-1) * blockSize + 1}">이전 블록</a></li></c:if>
					<c:forEach var="i" begin="${curBlock * blockSize+1}" end="${curBlock * blockSize + blockSize}" varStatus="st">
						<c:if test="${i <= totPage && pag == i}"><li class="page-item active"><a class="page-link text-white bg-secondary border-secondary" href="${ctp}/GuestList.gu?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
						<c:if test="${i <= totPage && pag != i}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/GuestList.gu?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
					</c:forEach>
						<c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/GuestList.gu?pageSize=${pageSize}&pag=${(curBlock+1) * blockSize + 1}">다음 블록</a></li></c:if>
						<c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/GuestList.gu?pageSize=${pageSize}&pag=${totPage}">마지막 페이지로</a></li></c:if>
				</ul>
			</div>
		</div>
		<p><br/><p>
		<jsp:include page="/include/footer.jsp" />
	</body>
</html>