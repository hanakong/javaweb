<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>title</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
	  <script>
	  	function fCheck() {
	    	let su1 = myform.su.value;
	    	let su2 = myform.su.value;
	    	let su3 = myform.su.value;
	    	let su4 = myform.su.value;
	    	let su5 = myform.su.value;
	    	
	    	if(isNaN(su1) || isNaN(su2) || isNaN(su3) || isNaN(su4) || isNaN(su5) ) {
	    		alert("숫자만 입력해주세요");
	    	}
	    	else {
	    		myform.submit();
	    	}
	  	}
	  </script>
	</head>
	<body>
		<p><br/><p>
		<div class="container">
			<h2>값 전송 연습</h2>
			<form name="myform" method="post" action="<%=request.getContextPath() %>/t0420/Test5Ok">
				<div>
					1. 수를 입력해주세요
					<input type="text" name="su" id="su1" class= "form-control"/>
				</div>
				<div>
					2. 수를 입력해주세요
					<input type="text" name="su" id="su2" class= "form-control"/>
				</div>
				<div>
					3. 수를 입력해주세요
					<input type="text" name="su" id="su3" class= "form-control"/>
				</div>
				<div>
					4. 수를 입력해주세요
					<input type="text" name="su" id="su4" class= "form-control"/>
				</div>
				<div>
					5. 수를 입력해주세요
					<input type="text" name="su" id="su5" class= "form-control"/>
				</div>
				<div class="text-center">
					<input type="button" value="전송" onclick="fCheck()" class="btn btn-success"/>
				</div>
			</form>
		</div>
		<p><br/><p>
	</body>
</html>