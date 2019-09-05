<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/test/resources/js/jquery-3.4.1.js"></script>
<script>
	
	
	$(function(){
		$("#loginBtn").on("click",function(){
			var flag1 = true;
			var flag2 = true;
			if($("#userId")[0].value.length<1){
				alert("ID 를 정확히 입력해주세요.")
				flag1 = false;
			}	
			if($("#userPw")[0].value.length<1){
				alert("PW 를 정확히 입력해주세요.")
				flag2 = false;
			}
			if(flag1&&flag2){
				$("#loginForm")[0].submit();
			}
		})
		function loginResult(){
				alert("로그인 실패! 비밀번호 또는 아이디가 오류입니다.")
			
		}
		
	})
	
</script>
<style>
.loginBtn{
	font-size:27px;
	margin-left:40px;
	margin-top:20px;
	border-radius:10px;
	height:75px;
	width:300px;
	color:white;
	background-color:gray;
}

.inputTag{
border-radius:10px;
margin-top:20px;
width:300px;
height:70px;
margin-left:40px;
font-size:24px;
text-align:center;
}
.signupGO{
	margin-top:50px;
	font-size:24px;
	text-align:center;
	width:720px;
}
.formAll{
	margin-left:170px;
	margin-top:20px;
	height:450px;
	width:380px;
	border-color:#c4c4c2;
	border-width:3px;
	border-radius:25px;
	border-style: outset;
}
</style>
</head>
<body>
	<c:if test="${login}!=null">
		<script>alert("아이디 또는 비밀번호가 오류가있습니다.")</script>
	</c:if>	
	<div class="body3">
	<div class="body2">
	<div class="body">
	<jsp:include page="/WEB-INF/views/headLine.jsp" flush="false"></jsp:include>
	
		<div class="formAll">	
			<h1 style="color:#c4c4c2; text-align:center;">로그인</h1>
		<form method="get" action="login2" id="loginForm">
		<input type="text" name ="userId" placeholder ="I D" class="inputTag" id="userId"><br>
		
		<input type="password" name ="userPw" placeholder ="PassWord" class="inputTag" id ="userPw"><br>
		</form>
		<input type="button" value="LOGIN" class="loginBtn" id="loginBtn">
		</div>
		<div class="signupGO">아직도 JK FOOD 의 회원이 아니세요?<br>간단히 가입이 가능합니다! <a href="goinsert"> 회원가입하기</a></div>
		</div>
		<jsp:include page="/WEB-INF/views/CopyRight.jsp" flush="false"></jsp:include>
	</div>
	</div>
</body>
</html>