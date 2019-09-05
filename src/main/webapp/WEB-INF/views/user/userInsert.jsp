<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/test/resources/js/jquery-3.4.1.js"></script>
<style>
 .formAll{
	margin-left:170px;
	margin-top:20px;
	height:580px;
	width:380px;
	border-color:#c4c4c2;
	border-width:3px;
	border-radius:25px;
	border-style:outset;
}
.body{
	width:750px;
	
}
.loginBtn{
	margin-top:20px;
	font-size:27px;
	margin-left:40px;
	border-radius:10px;
	height:75px;
	width:300px;
	color:white;
	background-color:gray;
}
.inputTag{
border-radius:10px;
margin-top:10px;
width:300px;
height:50px;
margin-left:40px;
font-size:24px;
text-align:center;
}
.textresult{
height:15px;
margin-top:5px;
font-size:15px;
text-align:center;
}
</style>
</head>
<body>
<div class="body3">
<div class="body2">
	<div class="body">
	<jsp:include page="/WEB-INF/views/headLine.jsp" flush="false"></jsp:include>

		<div class="formAll">
		<h1 id="textest" style="text-align:center;color:#c4c4c2;">회원가입</h1>

		<form method="post" action="userInsert" id="userInsert">
			<input type="text" id="selectId" name="userId" placeholder="I D"
				value="${userId}" onkeyup="selectIdd()" class="inputTag">
			<div id="result" class="textresult"></div>
			<input type="password" id="selectPw" name="userPw" placeholder="PassWord" class="inputTag">
			<div id="war1" class="textresult"></div> 
				<input type="text" id="selectName" name="userName" placeholder="Name" class="inputTag">
			<div id="war2" class="textresult"></div>
			<input type="text" id="selectPhone" name="userPhone" class="inputTag"
				placeholder="Phone Number">
				<div id="war3" class="textresult"></div> 
			
				<input type="button" value="회원가입하기" onclick="loginGo()" class="loginBtn">
		</form>
		</div>
	<c:if test="${sessionScope.loginId!=null}">
		
		<script>
			updateSet('${sessionScope.loginId}');
			function updateSet(loginid){
				$("#textest").text("회원 정보 수정");
				$("#selectId")[0].value = loginid;
				$(".loginBtn").val("정보 수정 하기");
				$("#selectId").removeAttr("onkeyup");
				$("#selectId").attr("readOnly","readOnly");
				$("#userInsert").attr("action","userUpdate");
				flag = true;
			}
		</script>
	</c:if>
	</div>
	<jsp:include page="/WEB-INF/views/CopyRight.jsp" flush="false"></jsp:include>
	</div>
</div>

	<script>
	var Pw = true;
	var Name = true;
	var Phone = true;
		function loginGo() {
			if (flag) {
				if (Pw&&Name
						&&Phone) {
					if (confirm("회원가입 하시겠습니까?")) {
						document.getElementById("userInsert").submit();
					}
				} else {
					alert("값이 정상적으로 입력되지 않았습니다.")
				}
			}else{
				alert("중복체크 확인해 주세요")
			}
		}
		
		function updateGo() {
			return confirm("수정 하시겠습니까?");

		}
	var flag = false;
		function selectIdd() {

			var Id = document.getElementById("selectId").value;
			var srcs = "/test/user/userSelect";
			$.ajax({
				url : srcs,
				type : "get",
				data : {
					"userId" : $("#selectId").val()
				},
				success : function() {
					$('#result').text("회원가입 가능한 아이디입니다.")
					$('#result').css('color','green')
					flag = true;
				},
				error : function() {
					$('#result').text("회원가입 불가능한 아이디입니다.")
					$('#result').css('color','red')
					flag = false;
				}
			});

		};

		$('#selectPw').on('keyup',function(){
			
			if($('#selectPw').val().length > 5 && $('#selectPw').val().length < 20){
				$("div#war1").text("아주 적당한 Pw 입니다.");
				$("div#war1").css('color','green')
				Pw = true;
			}else{
				$("div#war1").text("5~20자 이내에 입력해주세요.")
				$("div#war1").css('color','red')
				Pw = false;
			}			
		})
		$('#selectName').on('keyup',function(){
			if($('#selectName').val().length > 2 && $('#selectName').val().length < 20){
			$("div#war2").text("아주 적당한 이름 입니다.");
			$("div#war2").css('color','green')
			Name = true;
			}else{
				$("div#war2").text("2~20자 이내에 입력해주세요.")
				$("div#war2").css('color','red')
				Name = false;
			}
			if(!isNaN($('#selectName').val())){
				$("div#war2").text("숫자는 이름에 들어갈수없습니다.")
				$("div#war2").css('color','red')
				Name = false;
			}
		})
		$('#selectPhone').on('keyup',function(){
			if($('#selectPhone').val().length > 3 && $('#selectPhone').val().length < 20){
				
			$("div#war3").text("아주 적당한 Phone 입니다.");
			$("div#war3").css('color','green')
			Phone = true;
			}else{
				$("div#war3").text("3~20자 이내에 입력해주세요.")
				$("div#war3").css('color','red')
				Phone = false;
			}
			if(isNaN($('#selectPhone').val())){
				$("div#war3").text("글자는 번호에 들어갈수없습니다.")
				$("div#war3").css('color','red')
				Phone = false;
			}
		})
	</script>
	<c:if test="${idFind!=null}">
		<script>
			disableSet()
		</script>
	</c:if>
	
</body>
</html>