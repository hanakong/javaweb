<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<%
	int level = session.getAttribute("sLevel") == null ? 99 : (int)session.getAttribute("sLevel");
	pageContext.setAttribute("level", level);
%>
<script type="text/javascript">
	function deleteAsk() {
		let ans = confirm("정말로 탈퇴하시겠습니까?");
		if(ans) {
			let ans2 = confirm("탈퇴후 같은 아이디로 1개월간 재가입하실 수 없습니다. \n그래도 탈퇴하시겠습니까?");
			if(ans2) location.href="${ctp}/MemberDeleteAsk.mem";
		}
	}
	
</script>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
<!-- 		  <a class="navbar-brand" href="http://localhost:9090/javaweb/">Home</a> -->
  <a class="navbar-brand" href="http://192.168.50.89:9090/javaweb/">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="${ctp}/GuestList.gu">Guest</a>
      </li>
      <c:if test="${level<=4}">
	      <li class="nav-item">
	        <a class="nav-link" href="${ctp}/BoardList.bo">Board</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">PDS</a>
  	    </li>
	      <li>
					<div class="dropdown">
				    <button type="button" class="btn text-light dropdown-toggle" data-toggle="dropdown">study1</button>
				    <div class="dropdown-menu">
				      <a class="dropdown-item" href="${pageContext.request.contextPath}/study/0428_database/login.jsp">로그인연습1</a>
				      <a class="dropdown-item" href="${ctp}/mapping/Test1">URL 매핑(디렉토리 패턴)</a>
				      <a class="dropdown-item" href="${ctp}/mapping/Test5.do">URL 매핑(확장자 패턴1)</a>
				      <a class="dropdown-item" href="${ctp}/mapping2/Test5.mi">URL 매핑(확장자 패턴2)</a> <!-- 인터페이스를 한번 사용해보겠습니다 -->
				      <a class="dropdown-item" href="${ctp}/study/0428_database/Login.re">로그인연습2</a>
				      <a class="dropdown-item" href="${ctp}/Password.st">암호화연습</a>
				      <a class="dropdown-item" href="${ctp}/UuidForm.st">UUID연습</a>
				      <a class="dropdown-item" href="${ctp}/AjaxTest1.st">Ajax연습1</a>
				      <a class="dropdown-item" href="${ctp}/UserList.st">Ajax연습2</a>
					  </div>  
					</div>
				</li>
	      <li>
					<div class="dropdown">
				    <button type="button" class="btn text-light dropdown-toggle" data-toggle="dropdown">study2</button>
				    <div class="dropdown-menu">
				      <a class="dropdown-item" href="${ctp}/FileUpLoad1.st">파일업로드(싱글)연습</a>
				      <a class="dropdown-item" href="${ctp}/FileUpLoad2.st">파일업로드(멀티)연습</a>
				      <a class="dropdown-item" href="${ctp}/FileUpLoad3.st">파일업로드(멀티)연습2</a>
				      <a class="dropdown-item" href="${ctp}/FileUpLoad4.st">파일업로드(멀티)연습3</a>
				      <a class="dropdown-item" href="#">Link 3</a>
					  </div>  
					</div>
				</li>
				<li>
					<div class="dropdown">
				    <button type="button" class="btn text-light dropdown-toggle" data-toggle="dropdown">Mypage</button>
				    <div class="dropdown-menu">
				      <a class="dropdown-item" href="${ctp}/MemberMain.mem">회원메인방</a>
				      <a class="dropdown-item" href="${ctp}/MemberPwdUpdate.mem">회원비밀번호 변경</a>
				      <a class="dropdown-item" href="${ctp}/MemberPwdCheckForm.mem">회원정보수정</a>
				      <a class="dropdown-item" href="${ctp}/MemberList.mem">회원리스트</a>
				      <a class="dropdown-item" href="javascript:deleteAsk()">회원탈퇴신청</a>
				      <c:if test="${sLevel == 0}"><a class="dropdown-item" href="${ctp}/AdminMain.ad">관리자메뉴</a></c:if> 
					  </div>  
					</div>
				</li>
			</c:if>
			<li class="nav-item">
        <c:if test="${level > 4}"><a class="nav-link" href="${ctp}/MemberLogin.mem">Login</a></c:if>
        <c:if test="${level <= 4}"><a class="nav-link" href="${ctp}/MemberLogout.mem">Logout</a></c:if>
      </li>				   
			<li class="nav-item">
        <c:if test="${level > 4}"><a class="nav-link" href="${ctp}/MemberJoin.mem">Join</a></c:if>
      </li>				   
    </ul>
    
  </div>
</nav>