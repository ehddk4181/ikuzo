<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style>
.first{
	width:40px;
	heigth:40px;
	position:absolute;
	margin-left:160px;
	margin-top:5px;
}
.second{
	width:40px;
	heigth:40px;
	position:absolute;
	margin-left:340px;
	margin-top:5px;
}
.body{
	width: 750px;
	display:block;
	background-color:white;
}

.imagebox{
	width: 745.5px;
	height:200px;
	
	display:inline-flex;
	border-style:solid;
	
}

.imgg{
	margin-top:15px;
	height: 160px;
	width: 160px;
	margin-left:22px;
	outline-style: ridge;
	outline-color: black;

}
.marketName{
	
	height: 50px;
	width: 100px;
	position: absolute;
	border-style: solid;
	border-color: white;
	margin-top:60px;
	margin-left:25px;
}
.nameFont{
	font-size:20px;
	color:white;
	margin-top:10px;
}
.blockk{
	display:block;
}
.atag{
color:blue; 
text-decoration:none; 
margin-left:640px; 
margin-top:20px;
font-size:20px;
}
.atag:hover{
color:red;
}
</style>
<script>
function goLogin(seq,loginId) {
	if(loginId==""){
		alert("로그인이 필요한 기능입니다.")
		if(confirm("로그인화면으로 가시겠습니까?")){
			location.href="/test/user/login"
		}
	}else{
		location.href="/test/market/marketSelect?seq="+seq
	}
}
</script>
</head>
<body>
	<c:choose>
		<c:when test="${message!=null}">
			<script>
				alert("${message}")
			</script>
		</c:when>
	</c:choose>
<div class="body3">
	<div class="body2">
	<div class="body">
		<jsp:include page="headLine.jsp" flush="false"></jsp:include>
		
		<div class="blockk">
			<h2>등록순</h2>
			<div class="imagebox">
			
			
			<c:forEach items="${mList}" var="Market">
			<div class="imgg" onclick="goLogin('${Market.marketSeq}','${sessionScope.loginId}')">
				<div class="marketName"><center><div class="nameFont"><b>${Market.marketName}</b></div></center></div>
				<img src="/test/market/download?seq=${Market.marketSeq}" class="img" >
			</div>
			</c:forEach>
		
			</div>
		</div>
		<div class="blockk">
			<h2>평점순</h2>
			<div class="imagebox">
			<img src="/test/resources/MyCss/first.png" class="first" >
			<img src="/test/resources/MyCss/second.png" class="second" >
			<c:forEach items="${mmList}" var="Market">
			<div class="imgg" onclick="goLogin('${Market.marketSeq}','${sessionScope.loginId}')">
				<div class="marketName"><center><div class="nameFont"><b>${Market.marketName}</b></div></center></div>
				<img src="/test/market/download?seq=${Market.marketSeq}" class="img" >
			</div>
			</c:forEach>
		
			</div>
		</div>
		<div>
		<a href="marketPageGo" class="atag">Show More</a>
		
		</div>
	</div>
	<jsp:include page="CopyRight.jsp" flush="false"></jsp:include>
	</div>
</div>
</body>
</html>
