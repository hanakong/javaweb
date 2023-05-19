<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>photoView1.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict';
    
    // 이미지 1장 미리보기
		$(document).ready(function(){
			/* $("#fName").on("change", multiImageCheck(){
			}); */
			$(".imgDemo").hide();
			$("#fName").on("change", multiImageCheck);
		}); //선행으로 뭔가 처리할 것을 처리하고 불러주세요~할때 사용
		
    function multiImageCheck(e) {
    	//그림파일인지 아닌지만 체크
    	let files = e.target.files;
    	let filesArr = Array.prototype.slice.call(files);
    	
    	filesArr.forEach(function(f){
    		if(!f.type.match("image.*")) {// mime타입?
    			alert("업로드하신 파일은 이미지 파일이 아닙니다.");
    		} // 그림파일이 아닌 개수만큼 알람이 뜬다. 귀찮으면 지워버리자
    	});
    	// 멀티파일 이미지 미리보기
    	let i = e.target.files.length;
    	for(let image of e.target.files) { // in인 경우 index일때 of일때는 객체 그자체일때?
    		let img = document.createElement("img");
    		let reader = new FileReader();
    		reader.onload = function(e) {
    			img.setAttribute("src", e.target.result); //이미지 속성만 만들어놓았다
    			img.setAttribute("width", 200); //이미지 크기 설정
    		}
    		
    		reader.readAsDataURL(e.target.files[--i]);
    		document.querySelector(".imgDemo").appendChild(img);
    	}
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <h2>업로드 사진 미리보기2</h2>
  <form name="myform" id="myform" method="post" action="${ctp}/" enctype="multipart/form-data">
  	<hr/>
  	<div>
  	  <input type="file" name="fName" id="fName" multiple class="form-control-file border mb-2" />
  	  <!-- <img id="demo" width="150px"/> 한장이 아니고 여러장이기 때문에  -->
  	</div>
  	<div class="imgDemo"></div>
  	<br>
  	<div>
  	  사진 설명
  	  <textarea rows="4" name="content" id="content" class="form-control mb-3" placeholder="사진설명을 입력하세요."></textarea>
  	</div>
  	<div>
  	  <input type="submit" value="전송" class="btn btn-success form-control mb-2"/>
  	</div>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>