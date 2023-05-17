<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>scheduleMenu.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict';
    
    $(document).ready(function(){
	    $("#scheduleInputClose").hide();
    });
    
    function scheduleInputView() {
    	let str = '<hr/><div id="scheduleInputForm">';
    	str += '<form name="myform">';
    	str += '<table class="table table-bordered">';
    	str += '<tr><th>일정분류</th><td>';
    	str += '<select name="part" class="form-control">';
    	str += '<option>모임</option>';
    	str += '<option>업무</option>';
    	str += '<option>학습</option>';
    	str += '<option>여행</option>';
    	str += '<option>기타</option>';
    	str += '</select>';
    	str += '</td></tr>';
    	str += '<tr><th>내역</th><td>';
    	str += '<textarea name="content" rows="4" class="form-control"></textarea>';
    	str += '</td></tr>';
    	str += '<tr><td colspan="2" class="text-center">';
    	str += '<input type="button" value="일정등록" onclick="scheduleInputOk()" class="btn btn-success form-control"/>';
    	str += '</td></tr>';
    	str += '</table>';
    	str += '</form></div>';
    	
    	$("#scheduleInputView").hide();
    	$("#scheduleInputClose").show();
    	$("#demo").slideDown(500);
    	$("#demo").html(str);
    }
    
    // 일정 등록창 닫기
    function scheduleInputClose() {
    	$("#scheduleInputView").show();
    	$("#scheduleInputClose").hide();
    	$("#scheduleInputForm").slideUp(500);
    }
    
    // 일정 등록하기
    function scheduleInputOk() {
    	let part = myform.part.value;
    	let content = myform.content.value;
    	if(content.trim() == "") {
    		alert("일정을 입력하세요");
    		myform.content.focus();
    		return false;
    	}
    	let query = {
    			mid  : '${sMid}',
    			ymd  : '${ymd}',
    			part : part,
    			content  : content
    	}
    	
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/ScheduleInputOk.sc",
    		data  : query,
    		success:function(res) {
    			if(res == "1") {
    				alert("일정이 등록되었습니다.");
    				location.reload();
    			}
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <h4>${ymd}의 일정입니다.</h4>
  <p>오늘의 일정은 총 ${scheduleCnt}건 있습니다.</p>
  <hr/>
  <div>
    <input type="button" value="일정등록" onclick="scheduleInputView()" id="scheduleInputView" class="btn btn-primary"/>
    <input type="button" value="등록창닫기" onclick="scheduleInputClose()" id="scheduleInputClose" class="btn btn-primary"/>
    <input type="button" value="돌아가기" onclick="location.href='${ctp}/ScheduleList.sc';" class="btn btn-warning"/>
  </div>
  <div id="demo"></div>
  <hr/>
  <c:if test="${scheduleCnt != 0}">
    <table class="table table-hover text-center">
      <tr class="table-dark text-dark">
	      <th>번호</th>
	      <th>내역</th>
	      <th>분류</th>
	      <th>비고</th>
      </tr>
      <c:forEach var="vo" items="${vos}" varStatus="st">
        <tr>
          <td>${st.count}</td>
          <td>
          	${vo.content}
          </td>
          <td>${vo.part}</td>
          <td>
            <input type="button" value="수정" onclick="updateCheck('${vo.idx}','${vo.part}','${vo.content}')" class="btn btn-warning"/>
            <input type="button" value="삭제" onclick="deleteCheck(${vo.idx})" class="btn btn-danger"/>
          </td>
        </tr>
        <tr><td colspan="4" class="m-0 p-0"><div id="updateDemo${vo.idx}"></div></td></tr>
      </c:forEach>
      <tr><td colspan="4" class="m-0 p-0"></td></tr>
    </table>
  </c:if>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>