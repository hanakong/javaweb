<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jstl_Ex2.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
  'use strict';
  let pics = [];
  let pic;
  var res;
  	function addItem() {
  		let pic = myform.pic.value;
  		if(pic=='') alert("그림을 선택해주세요");
  		else {
  			for(let i=0;i<myform.pic.length;i++) {
  				if(myform.pic.option[i].selected) {
  					items.push(document.getElementById("pic")[i].value);
  				}
  			}
  		}
			let res += demo.innerHTML="<img src='${pageContext.request.contextPath}/images/"+pic+".jpg'>"
  		res += document.getElementById("mid").value;
			demo.innerHTML += res;
  	}
  	function allClear() {
  		let res='';
  		demo.innerHTML="";
  	}
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <pre>
    콤보상자에 숫자 1~6까지를 기억시키고 화면에 보여준다.(화면에 보여주는 숫자는 1~6.jpg인 그림파일명이다.)
    콤보상자 옆에 텍스트박스를 위치시키고, 해당 그림의 '그림명'을 입력후 '저장'버튼을 클릭하면,
    '그림명'과, '그림파일명'을 저장시켜준다.(여러개를 저장할 수 있도록 처리)
    마지막으로 '출력'버튼을 클릭하면 아래쪽(demo)으로 저장된 모든 그림파일과 그림파일명을 출력한다.
  </pre>
  <form name="myform">
		<select name="pic" size="6" multiple>
			<c:forEach var="i" begin="1" end="6">
				<option>${i}</option>
			</c:forEach>
		</select>
		 <input type="text" id="mid" placeholder="입력 예시 1,3,5(1~6까지)" />
		 <button type="button" onclick="addItem()">저장</button> &nbsp;
		 <button type="button" onclick="showMe()">출력</button>
		 <button type="button" onclick="allClear()">지우기</button>
	</form>
</div>
<div id=demo></div>
<p><br/></p>
</body>
</html>