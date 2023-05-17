<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>ModalTest1</title>
		<jsp:include page="/include/bs4.jsp" />
	</head>
	<body>
	<jsp:include page="/include/header.jsp" />
		<p><br/><p>
		<div class="container">
			<h2>Modal 연습1</h2>
			<hr/>
			<h5>메시지 띄우기</h5>
			<p>
				<input type="button" value="표준모달창" class="btn btn-primary" data-toggle="modal" data-target="#myModal1"/>
				<input type="button" value="부드러운 모달창" class="btn btn-info" data-toggle="modal" data-target="#myModal2"/>
				<input type="button" value="중앙 모달창" class="btn btn-secondary" data-toggle="modal" data-target="#myModal3"/>
				<input type="button" value="모달창 크기변경" class="btn btn-warning" data-toggle="modal" data-target="#myModal4"/>
				<input type="button" value="내용 많은 모달창" class="btn btn-danger" data-toggle="modal" data-target="#myModal5"/>
				<input type="button" value="내용 많은 모달창2" class="btn btn-success" data-toggle="modal" data-target="#myModal6"/>
			</p>
		</div>
			<div class="modal" id="myModal1">
		    <div class="modal-dialog">
		      <div class="modal-content">
		      
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h4 class="modal-title">Modal Heading</h4>
		          <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
		          <button type="button" class="close" data-dismiss="modal">×</button>
		        </div>
		        <!-- Modal body -->
		        <div class="modal-body">
		          Modal body..
		        </div>
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
		        </div>
		      </div>
		    </div>
		  </div>
			<div class="modal fade" id="myModal2"> <!-- fade 추가 -->
		    <div class="modal-dialog">
		      <div class="modal-content">
		      
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h4 class="modal-title">Modal Heading</h4>
		          <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
		          <button type="button" class="close" data-dismiss="modal">×</button>
		        </div>
		        <!-- Modal body -->
		        <div class="modal-body">
		          Modal body..
		        </div>
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
		        </div>
		      </div>
		    </div>
		  </div>
		  <!-- 여기3번 -->
			<div class="modal fade" id="myModal3"> 
		    <div class="modal-dialog modal-dialog-centered">
		      <div class="modal-content">
		      
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h4 class="modal-title">Modal Heading</h4>
		          <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
		          <button type="button" class="close" data-dismiss="modal">×</button>
		        </div>
		        <!-- Modal body -->
		        <div class="modal-body">
		          Modal body..
		        </div>
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
		        </div>
		      </div>
		    </div>
		  </div>
		  <!-- 여기4번 -->
			<div class="modal fade" id="myModal4"> 
		    <div class="modal-dialog modal-dialog-centered modal-xl"> <!-- sm : 소 lg : 중 xl : 대 -->
		      <div class="modal-content">
		      
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h4 class="modal-title">Modal Heading</h4>
		          <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
		          <button type="button" class="close" data-dismiss="modal">×</button>
		        </div>
		        <!-- Modal body -->
		        <div class="modal-body">
		          Modal body..
		        </div>
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
		        </div>
		      </div>
		    </div>
		  </div>
		  <!-- 여기5번 -->
			<div class="modal fade" id="myModal5"> 
		    <div class="modal-dialog modal-dialog-centered modal-sm"> <!-- sm : 소 lg : 중 xl : 대 -->
		      <div class="modal-content">
		      
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h4 class="modal-title">Modal Heading</h4>
		          <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
		          <button type="button" class="close" data-dismiss="modal">×</button>
		        </div>
		        <!-- Modal body -->
		        <div class="modal-body">
		          <p>Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789</p>
		          <p>Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789</p>
		          <p>Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789</p>
		        </div>
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
		        </div>
		      </div>
		    </div>
		  </div>
		  <!-- 여기6번 -->
			<div class="modal fade" id="myModal6"> 
		    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-sm"> <!-- sm : 소 lg : 중 xl : 대 -->
		      <div class="modal-content">
		      
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h4 class="modal-title">Modal Heading</h4>
		          <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
		          <button type="button" class="close" data-dismiss="modal">×</button>
		        </div>
		        <!-- Modal body -->
		        <div class="modal-body">
		          <p>Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789</p>
		          <p>Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789</p>
		          <p>Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789Modal body..123456789</p>
		        </div>
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
		        </div>
		      </div>
		    </div>
		  </div>
		<p><br/><p>
		<jsp:include page="/include/footer.jsp" />
	</body>
</html>