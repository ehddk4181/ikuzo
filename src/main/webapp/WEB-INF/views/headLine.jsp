<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/test/resources/js/jquery-3.4.1.js"></script>
<script>
	
	function searchGo(){
		var flag = true;
		alert('ss')
		$('#searchForm>*').each(function(i,item){
			if(i==0){	
				if(item.value.length==0){		
					flag = false;
				}
			}else if(i==3){}
			else{
				if(item.value.length<2){
					flag = false;
				}
			}
			
		})
		if(flag){	
			$('#searchForm')[0].submit();
		}else{
			alert('검색 타입 선택 또는 검색어 길이가 너무짧습니다.')
		}
	}

</script>
<title>Insert title here</title>
<style>
.image {
	margin-top:15px;
	height: 100px;
	width: 100px;
	margin-left: 20px;	
}

.body3{
background-image: url("/test/resources/MyCss/All.png");
}
.headLine {
	display: inline-flex;
	height: 180px;
	width: 750px;
	border-style:solid;
	border-width:0px;
	border-bottom-width:1px;
}
.headLine2{
	float:right;
	height: 60px;
	width: 590px;
	display:inline-flex;
	border-style:solid;
	border-width:0px;
	border-bottom-width:1px;
}
.headLineText{
	margin-top:15px;
	width:310px;
}
.headLineBox{
	display:block;
	height: 100px;
	width: 160px;

}
.body2{
	opacity:0.9;
	margin-left:325px;
	width:850px;
	border-radius:30px;
	background-color:white;
}
.body{
	margin-left:50px;
}
.img{
	height: 160px;
	width: 160px;
}
.imgS{
	margin-top:10px;
	margin-left:5px;
	margin-right:5px;
	height: 40px;
	width: 40px;
	float:right;
}

.headLineFont{
	margin-left:25px;
	margin-top:10px;
	font-size:20px;
	color:black;
}
.listbox{

	float:right;
	width:290px;
}
.searchBox{
	display:inline-flex;
	width:570px;
	margin-left:40px;
	margin-top:30px;

}
.selectTag{
	width:110px;
	height:50px;
	font-size:17px;
	border-width:0px;
	border-bottom-width:2px;
	border-color:#cfcfcf;
	appearance: none;
}
.selectInput{
	width:220px;
	height:46px;
	font-size:20px;
	border-width:0px;
	border-bottom-width:2px;
	border-color:#cfcfcf;
	
}
.selectbtn{
	height:49px;
	width:80px;
	background-color:#dedede;
	font-size:25px;
	color:white;
	border-radius:20px;
	border-width:0px;
}

</style>
</head>
<body>
<div class="headLine">
			<div class="headLineBox">
				<a href="/test/"><img src="/test/resources/MyCss/dish.png" class="image"><br></a>
				<h3 class="headLineFont">JK FOOD</h3>
			</div>
			<div style="display: block">
			<div class="headLine2">
				<div class="headLineText">
				<b>코엑스의 먹거리 헌터들 여기여기 모여라!</b>
				</div>
				<div class="listbox">
			<c:if test="${sessionScope.loginId == null}">
				<a href="/test/user/login"><img src="/test/resources/MyCss/password.png" class="imgS"></a>
			</c:if>
			<c:if test="${sessionScope.loginId != null}">
				<a href="/test/user/goinsert"><img src="/test/resources/MyCss/profile.png" class="imgS"></a>
				<a href="/test/logout"><img src="/test/resources/MyCss/logout.png" class="imgS"></a>
			</c:if>
			<c:if test="${sessionScope.admin != null}">
				<a href="/test/goAdmin"><img src="/test/resources/MyCss/maintenance.png" class="imgS"></a>
			</c:if>
			<c:if test="${sessionScope.loginId != null}">
				<a href="/test/book/bookList"><img src="/test/resources/MyCss/Cal.png" class="imgS"></a>
			</c:if>
			</div>
			</div>
			<div class="searchBox">
				<form action="/test/market/marketSelectAll" method="get" id="searchForm">
				<select class="selectTag" name="searchLocation">
					<option value="1">외부식당</option>
					<option value="0">내부식당</option>
					<option value="all">전체검색</option>
					<option value="" selected="selected" disabled="disabled" hidden="true" value="none">위치선택</option>
				</select>
				<select class="selectTag" style="margin-left:5px;" name="searchKind">
					<option value="Chines">중식</option>
					<option value="Korean">한식</option>
					<option value="American">양식</option>
					<option value="Japenes">일식</option>
					<option value="all">전체검색</option>
					<option value="" selected="selected" disabled="disabled" hidden="true" value="none">메뉴선택</option>
				</select>
				<input type="text" name="searchTitle" placeholder="검색어를 입력해 주세요" class="selectInput" style="margin-left:15px;">
				<input type="button"  value="검색" class="selectbtn" onclick="searchGo()">
				</form>
			</div>
			</div>
		</div>

</body>
</html>