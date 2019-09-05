<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
.im{
	width:750px;
	height:300px;
	display:inline-flex;
}
.im2{
	
	width:375px;
	height:300px;
}
.im3{
	margin-left:80px;
	width:220px;
	height:220px;
	border-radius:20px;
}
.im2:hover {
	border-style:outset;
	border-width:3px;
	border-radius:20px;
}
.body{
	width:750px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="body3">
<div class="body2">
	<jsp:include page="headLine.jsp" flush="false"></jsp:include>
	<div class="body">
	<h1 style="text-align: center;">점장님 환영합니다!</h1>
	<div class="im">
		
		<div class="im2">
			<h3 style="text-align: center;">뒤로가기</h3>
			<a href="/test/"><img src="/test/resources/MyCss/exit-door-symbol.png" class="im3"></a>
		</div>
		<div class="im2">
			<h3 style="text-align: center;">가게만들기</h3>
			<a href="/test/market/marketInsertGo"><img src="/test/resources/MyCss/tools.png" class="im3"></a>
		</div>
	</div>
	
	

	</div>
	<jsp:include page="CopyRight.jsp" flush="false"></jsp:include>
	
	</div>
	</div>
</body>
</html>