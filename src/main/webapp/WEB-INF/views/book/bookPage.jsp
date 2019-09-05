<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/test/resources/js/jquery-3.4.1.js"></script>
<title>Insert title here</title>
<style>
.book {
	border-style: solid;
	height: 400px;
	width: 450px;
	border-radius: 30px;
}

.time {
	margin-left: 40px;
	width: 200px;
	height: 40px;
	border-width: 0 0 2px 0;
	border-style: solid;
	border-color: #5921ff;
	font-size: 22px;
	color: #5921ff;
}

.margin {
	margin-left: 45px;
}

#bookBtn {
	width: 180px;
	height:60px;
	margin-top:30px;
	margin-left:85px;
	border-radius:20px;
	border-color: #5921ff;
	background-color:#5921ff;
	color:white;
	font-size:23px;
}
#bookBtn:hover {
	background-color:#ff8cfb;
}
</style>
<script>
	$(function(){
		$("#bookBtn").on("click",function() {bookCheck()});	
	})
	
	torf();
	function torf() {
		if('${complete}'!=''){
			opener.alertM('${complete}');
			opener.focus();
			window.close();
		}
		if('${message}'!=''){
			opener.alertM('${message}');
			opener.focus();
			window.close();
		}
		
	}
	function bookCheck(){
		var flag = true;
		$("input").each(function(i,item){
			if(item.value.length<1){
				flag = false;
			}
		})
		if(flag){
			$("#bookForm")[0].submit();
		}else{
			alert("입력하지 않은 값이 존재합니다.")
		}
	}
</script>
</head>
<body>
		<div class="book">
		<h1 style="text-align: center; color:#5921ff;">예약하기</h1>
		<form action="/test/market/marketTimeTableSelect" method="Post" id="bookForm">
		<div class="margin">
		<table>
			<tr>
				<th height="40px" width="85px" style="color: #5921ff; font-size:20px">예약시간</th><td><input type="time" name="bookTime" class="time"></td>
			</tr>
			<tr>
				<th height="40px" width="85px" style="color: #5921ff; font-size:20px">예약날짜</th><td><input type="date" name="bookDate" class="time" id ="today"></td>
			</tr>
			<tr>
				<th height="40px" width="85px" style="color: #5921ff; font-size:20px">인원수</th><td><input type="number" name="people" placeholder="HowManyPeople?" class="time" min="0"></td>
			</tr>
			<tr>
				<th width="85px" height="40px" style="color: #5921ff; font-size:20px">예약성함</th><td><input type="text" name="userName" placeholder="BookerName" class="time"></td>
			</tr>
		</table>
		<input type="hidden" value="${seq}" name="marketSeq">
		<input type="hidden" value="${sessionScope.loginId}" name="userId">
		
		<input type="button" value="예약하기" id="bookBtn">
		</div>
		</form>
	</div>
	<script>
		document.getElementById("today").min = new Date();
	</script>

</body>
</html>