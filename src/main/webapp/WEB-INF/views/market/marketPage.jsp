<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.reviewLine:hover{
background-color: #f5f5f5;
}
.aTag:hover{
	color:red;
}
.aTag{
color:black; 
text-decoration:none; 
}
.reviewLine{
	height:50px;
	width:750px;
	display:inline-flex;
	border-style:solid;
	border-width:0 0 2px 0;
	border-color:#cfcfcf;
}
.reviewLine{
	height:50px;
	width:750px;
	display:inline-flex;
	border-style:solid;
	border-width:0 0 2px 0;
	border-color:#cfcfcf;
}
.reviewCss{
	height:50px;
	width:750px;
	display:inline-flex;
	border-style:solid;
	border-width:2px 0 2px 0;
	border-color:#cfcfcf;
}
.rTitle{
width:150px;
	border-style:solid;
	border-width:0 2px 0 0;
	border-color:#cfcfcf;
}
.rContent{
width:350px;
	border-style:solid;
	border-width:0 2px 0 0;
	border-color:#cfcfcf;
}
.paging{
	text-align:center;
	font-size:25px;
	color:red;
	width:750px;
	
}
.rPoint{
width:100px;
	border-style:solid;
	border-width:0 2px 0 0;
	border-color:#cfcfcf;
}
.rUser{
width:100px;
}
.body{
width:750px;}
</style>
<title>Insert title here</title>
<script>
	function goLogin(seq,loginId) {
		if(loginId==""){
			alert("로그인이 필요한 기능입니다.")
			if(confirm("로그인화면으로 가시겠습니까?")){
				location.href="/test/user/login"
			}
		}else{
			location.href="marketSelect?seq="+seq
		}
	}
	function pageProc(currentPage) {
		location.href="/test/market/marketSelectAll?currentPage=" + currentPage;
	}

</script>
</head>
<body>
<div class="body3">
<div class="body2">
<div class="body">
	<jsp:include page="/WEB-INF/views/headLine.jsp" flush="false"></jsp:include>
	<h1 style="text-align:center; width:750px;">식당목록</h1>
	<form action="marketSelect" method="get">
	
	</form>	
	<div class="reviewCss">
						<div class="rTitle" style="text-align:center;"><b><div style=" margin-top:15px;">제목</div></b></div>
						<div class="rContent" style="text-align:center;"><b><div style=" margin-top:15px;">메뉴종류</div></b></div>
						<div class="rPoint" style="text-align:center; "><b><div style=" margin-top:15px;">평점</div></b></div>
						<div class="rUser" style="text-align:center; "><b><div style=" margin-top:15px; margin-left:10px;">등록일</div></b></div>

					</div>
	<c:forEach items="${mList}" var="Market">
	<a onclick="goLogin('${Market.marketSeq}','${sessionScope.loginId}')">
	<div class="reviewLine">
	<div class="rTitle" style="text-align:center;"><b><div style=" margin-top:15px;">${Market.marketName}</div></b></div>
						<div class="rContent" style="text-align:center;"><b><div style=" margin-top:15px;">${Market.marketKind}</div></b></div>
						<div class="rPoint" style="text-align:center; "><b><div style=" margin-top:15px;">${Market.marketPoint}<fmt:formatNumber value="${Market.marketPoint}" pattern="#0.00"/></div></b></div>
						<div class="rUser" style="text-align:center; "><b><div style=" margin-top:15px; margin-left:10px;"><fmt:parseDate value="${Market.indate}" var="parsedRegdate" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
	<fmt:formatDate value="${parsedRegdate}" pattern="yyyy-MM-dd"/></div></b></div></div>
	</c:forEach>
	<table>
	<tr>
	<td id="navigator" colspan="5">
		<div class="paging">
		<a href="javascript:pageProc(${navi.currentPage - navi.pagePerGroup})"  class="aTag">◁◁ </a> &nbsp;&nbsp;
		<a href="javascript:pageProc(${navi.currentPage - 1})" class="aTag">◁</a> &nbsp;&nbsp;
		<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
			<c:if test="${counter == navi.currentPage}"><b></c:if>
				<a href="javascript:pageProc(${counter})" class="aTag">${counter}</a>&nbsp;
			<c:if test="${counter == navi.currentPage}"></b></c:if>
		</c:forEach>
		&nbsp;&nbsp;
		<a href="javascript:pageProc(${navi.currentPage + 1})" class="aTag">▷</a> &nbsp;&nbsp;
		<a href="javascript:pageProc(${navi.currentPage + navi.pagePerGroup})" class="aTag">▷▷</a>
		</div>
	</td>
</tr>
</table>
	</div>
	<jsp:include page="/WEB-INF/views/CopyRight.jsp" flush="false"></jsp:include>
</div>
</div>
	

</body>
</html>