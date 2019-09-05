<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.red{
color:red;
}
</style>
	<script>
		function gohome(){
			location.href="//";
		}
	
	</script>
</head>
<body>
	<h1 class="red">${Message}</h1><br>
	<h1>${ex}</h1>
	<button onclick="gohome()">돌아가기</button>
</body>
</html>