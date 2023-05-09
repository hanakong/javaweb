<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>userList</title>
		<jsp:include page="/include/bs4.jsp" />
		<style>
			th {
				text-align : center;
				background-color : #eee;
			}
		</style>
		<script>
			'use strict';
			function userInput() {
				let mid = $("#mid").val().trim();
				let name = $("#name").val().trim();
				let age = $("#age").val().trim();
				let address = $("#address").val().trim();
				
				if(mid == "") {
					alert("아이디를 입력하세요");
					$("#mid").focus();
					return false;
				}
				else if(name == "") {
					alert("성명을 입력하세요");
					$("#name").focus();
					return false;
				}
				else if(age == "") {
					alert("나이를 입력하세요");
					$("#age").focus();
					return false;
				}
				else if(address == "") {
					alert("주소를 입력하세요");
					$("#address").focus();
					return false;
				}
				
				let query = {
						mid : mid,
						name : name,
						age : age,
						address : address
				}
				
				$.ajax({
					type : "post",
					url : "${ctp}/UserInput.st",
					data : query,
					success : function(res) {
						if(res == "1") {
							alert("회원 등록되었습니다.");
							location.reload();
						}
						else {
							alert(res);
							$("#mid").focus();
						}
					},
					error : function() {
						alert("전송오류!");
					}
				});
			}
			// user 삭제처리
			function userDel(idx) {
				let ans = confirm("선택된 회원을 삭제하시겠습니까?");
				if(!ans) return false;
				
				$.ajax({
					type : "post",
					url : "${ctp}/UserDelete.st",
					data : {idx : idx},
					success : function(res) {
						if(res == "1") {
							alert("수정완료!");
						}
					},
					error : function() {
						alert("전송 실패!");
					}
				});
			}
			//개별조회
			function userSearch(idx) {
				$.ajax({
					type : "post",
					url : "${ctp}/UserSearch.st",
					data : {idx : idx},
					success : function(res) {
						let str = res.split("/");
						$("#mid").val(str[1]);
						$("#name").val(str[2]);
						$("#age").val(str[3]);
						$("#address").val(str[4]);
					},
					error : function() {
						alert("전송오류!");
					}
				});
			}
			//수정하기
			function userUpdate() {
				
			}
		</script>
	</head>
	<body>
	<jsp:include page="/include/header.jsp" />
		<p><br/><p>
		<div class="container">
			<h2>Ajax를 이용한 CRUD 구현하기</h2>
			<form>
				<table class="table table-bordered">
					<tr>
						<th>아이디</th>
						<td><input type="text" name="mid" id="mid" autofocus class="form-control" /></td>
					</tr>
					<tr>
						<th>성명</th>
						<td><input type="text" name="name" id="name" class="form-control" /></td>
					</tr>
					<tr>
						<th>나이</th>
						<td><input type="number" name="age" id="age" class="form-control" /></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" name="address" id="address" class="form-control" /></td>
					</tr>
					<tr>
						<td colspan="2" class="text-center">
							<input type="button" value="User등록" onclick="userInput()" class="btn btn-success"/>
							<input type="reset" value="다시입력" class="btn btn-warning"/>
							<input type="button" value="User수정" onclick="userUpdate()" class="btn btn-primary"/>
							<input type="button" value="전체보기" onclick="location.href='${ctp}/UserList.st';" class="btn btn-secondary"/>
						</td>
					</tr>
				</table>
			</form>
			<hr/>
			<h2>User 전체 리스트</h2>
			<table class="table table-hover text-center">
				<tr class="table-dark text-dark">
					<th>번호</th>
					<th>아이디</th>
					<th>성명</th>
					<th>나이</th>
					<th>주소</th>
					<th>비고</th>
				</tr>
				<c:forEach var="vo" items="${vos}" varStatus="st">
					<tr>
						<td>${vo.idx}</td>					
						<td>${vo.mid}</td>					
						<td>${vo.name}</td>					
						<td>${vo.age}</td>					
						<td>${vo.address}</td>
						<td>
							<a href="javascript:userSearch(${vo.idx})" class="btn btn-secondary">개별조회</a>
							<a href="javascript:userDel(${vo.idx})" class="btn btn-danger">삭제</a>
						</td>					
					</tr>
				</c:forEach>
				<tr><td colspan="6" class="m-0 p-0"></td></tr>
			</table>
		</div>
		<p><br/><p>
		<jsp:include page="/include/footer.jsp" />
	</body>
</html>