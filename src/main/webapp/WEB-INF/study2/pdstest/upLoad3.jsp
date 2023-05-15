<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>upLoad3.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict';
    let cnt = 1;
    
    function fCheck() {
    	let fName1 = document.getElementById("file1").value;
			let ext = fName1.substring(fName1.lastIndexOf(".")+1).toUpperCase();
			let maxSize = 1024 * 1024 * 10; // 업로드 가능 파일 : 10Mbyte까지로 하기 위해 설정
			 
			/* alert("확장자 체크 : " + ext); */
			if(fName1.trim() == "") {
				alert("업로드할 파일을 선택하세요");
			}
			let fileSize = document.getElementById("file1").files[0].size; // 파일 사이즈 체크
			if(ext != "JPG" && ext != "GIF" && ext != "PNG" && ext != "ZIP" && ext != "HWP" && ext != "PPT" && ext != "PPTX") {
					alert("업로드 가능한 파일은 'jpg,gif,png,zip,hwp,ppt,pptx'입니다.");
			}
			else if(fileSize > maxSize) {
				alert("업로드 가능한 파일의 최대 용량은 10MByte 입니다.")
			}
			else {
				//alert("전송완료");
				myform.submit();
			}
    }
    // 동적폼(파일 업로드 박스 추가하기)
    function fileBoxAppend() {
    	cnt++;
    	let fileBox = '';
    	fileBox += '<div id="fBox'+cnt+'">';
    	fileBox += '<input type="file" name="fName'+cnt+'" id="file'+cnt+'" class="form-control-file border mb-2" style="float:left; width:85%" />';
    	fileBox += '<input type="button" value="삭제" onclick="deleteBox('+cnt+')" class="btn btn-danger form-control mb-2 ml-2" style="width:10%" />';
    	fileBox += '';
    	fileBox += '</div>';
    	$("#fileBoxAppend").append(fileBox);
    }
    // 추가된 박스 삭제처리
    function deleteBox(cnt) {
    	$("#fBox"+cnt).remove();
    }
    
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <h2>파일 업로드 연습2(멀티파일처리)</h2>
  <p>COS라이브러리를 이용한 파일 업로드</p>
  <div>(http://servlets.com/cos/)</div>
  <hr/>
  <form name="myform" method="post" action="${ctp}/FileUpLoad3Ok.st" enctype="multipart/form-data">
    파일명 : 
    <div>
	    <input type="button" value="파일박스 추가" onclick="fileBoxAppend()" class="btn btn-info mb-2" />
	    <input type="file" name="fName1" id="file1" class="form-control-file border mb-2">
    </div>
    <div id="fileBoxAppend">
    </div>
    <input type="button" value="전송" onclick="fCheck()" class="btn btn-success form-control"/>
    <input type="button" value="다운로드 사이트로 이동" onclick="location.href='${ctp}/DownLoad.st'" class="btn btn-secondary" />
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>