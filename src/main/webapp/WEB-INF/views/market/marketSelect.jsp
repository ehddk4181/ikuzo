<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/test/resources/js/jquery-3.4.1.js"></script>
 <meta name="viewport" content="initial-scale=1.0">
<title>Insert title here</title>

<script>
$(function(){
	menuSelect('${Market.marketSeq}');
	$("#reviewGo").on("click",function(){reviewShow()});
	marketImgSelect();
})
	function reviewCheck(){
		if($(".reviewText")[0].value.length<2){
			alert("내용을 입력하세요(2자 이상)")
			return false;
		}
		if($(".reviewInput")[0].value.length<2){
			alert("재목을 입력하세요(2자 이상)")
			return false;
		}
		$("#reviewInsert")[0].submit();
	}
	var cnt = 0;
		function menuInsert(){
			alert("hi")
			$.ajax({
				url:"/test/market/menuInsert",
				type:"post",
				data:$("#menuInsertForm").serialize(),
				success:function(){
					alert('등록성공');
				},
				error:function(){
					alert("등록실패");
				}
			})
			
		}
		function marketImgSelect(){
			$.ajax({
				url:"/test/market/marketImgSelect",
				type:"get",
				data:{"marketSeq":${Market.marketSeq}},
				success:function(result){
					$(result).each(function(i,item){
						$("#imgResult").append(
						'<img src="/test/market/download2?fileName='+item.savedName+'" class="allImg">')
					})
				},
				error:function(){
					alert("못대려옴");
				}
			});
			
		}
		function menuSelect(seq){
			cnt = cnt + 1
			if(cnt==2){
				$('#h1tag').text("Menu 접기")
				cnt = 0;
			}
			$.ajax({
				url:"/test/market/menuSelect",
				type:"post",
				data:{"marketSeq":seq},
				datatype:'json',
				success:function(result){
					getMaxMin(result);
					$('#menuList').empty();
					$('#menuList').append(
					'<tr><th width="150px">메뉴이름  </th><th width="150px">가격</th><th width="150px">메뉴이름  </th><th width="150px">가격</th></tr>'
					);
					$(result).each(function(index,item){
						if(index%2 == 0) $('#menuList').append('<tr>');
						else $('#menuList').append('</tr>');
						$('#menuList').append('<td width="150px"  style="text-align:center;">'+item.menuName+'</td>'
								+ '<td width="150px" style="text-align:center;">'+item.menuprice+'</td>');
					
						if(cnt==1&&index==1){
							$('#h1tag').text("Menu 펼치기")
							return false;
						}
						})
						
					},
				error:function(){
					alert("조회 실패");
				}
			})
			
		}
		
	function getMaxMin(result){
		var max = 0;
		var min = 0;
		$(result).each(function(i,item){
			if(max < item.menuprice){
				max = item.menuprice;
			}
		})
		min = max;
		$(result).each(function(i,item){
			if(min > item.menuprice){
				min = item.menuprice;
			}
		})
		$("#maxP").text(max);
		$("#minP").text(min);
	}
	
	function reviewShow(){
		
		if($("#reviewShow>*")[0]==null){
			$("#reviewShow").empty();
		$("#reviewShow").append(
				'<h1 style="margin-left:30px">리뷰 등록</h1>'+
				'<form action="ReviewInsert" method="Post" id="reviewInsert">'+
					'<div style="display:inline-flex;">'+
					'<input type="text" name ="reviewTitle" placeholder ="ReviewTitle" class="reviewInput">'+
					'<div class="radiobox">'+
					'1점<input type="Radio" name = "reviewPoint" value=1 checked="checked">'+
					'2점<input type="Radio" name = "reviewPoint" value=2>'+
					'3점<input type="Radio" name = "reviewPoint" value=3>'+
					'4점<input type="Radio" name = "reviewPoint" value=4>'+
					'5점<input type="Radio" name = "reviewPoint" value=5>'+
					'</div>'+
					'</div>'+
					'<div style="display:inline-flex;">'+
					'<textarea rows="5" cols="80"  name ="reviewContent" placeholder ="ReviewContent" class="reviewText"></textarea>'+
					'<input type="button" value="댓글등록" onclick="reviewCheck()" class="reviewBtn">'+
					'</div>'+
					'<input type="hidden" name ="userId" value ="${sessionScope.loginId}"><br>'+
					'<input type="hidden" name ="marketSeq" value ="${Market.marketSeq}">'+
					'</form><h1 style="margin-left:30px">리뷰보기</h1>'
			)
			$("#reviewGo")[0].value = "Close";
			$("#reviewShow").css("border-style","solid");
			getReview('${Market.marketSeq}')
				
		}else{
			$("#reviewShow").empty();
			$("#reviewShow").css("border-style","hidden")
			$("#reviewGo")[0].value = "Open"
		}
	}
	
	function insertGo() {
		return confirm("댓글을 등록하시겠습니까?")
		
	}
	var bookPage;
	function getBookPage(seq) {
		if(confirm("예약하시겠습니까")){
			bookPage = window.open("/test/book/bookPageOpe?marketSeq="+seq,"_blank",
					"width=100,height=100,,left=100");
			bookPage.moveTo(400, 400);
			bookPage.resizeTo(400, 400);
		}
		
	}
	function alertM(message){
		alert(message);
	}
	function getReview(seq){
		$.ajax({
			url:"/test/market/reviewShowAll",
			type:"post",
			data:{"marketSeq":seq},
			datatype:'json',
			success:function(result){
				$("#reviewShow").append(
	
					'<div class="reviewCss">'+
						'<div class="rTitle" style="text-align:center; "><b><div style=" margin-top:15px;">제목</div></b></div>'+
						'<div class="rContent" style="text-align:center;"><b><div style=" margin-top:15px;">내용</div></b></div>'+
						'<div class="rPoint" style="text-align:center; "><b><div style=" margin-top:15px;">평점</div></b></div>'+
						'<div class="rUser" style="text-align:center; "><b><div style=" margin-top:15px; margin-left:10px;">작성자</div></b></div>'+

					'</div>'
				)
				$(result).each(function(i,item){
				$("#reviewShow").append(
						'<div class="reviewLine">'+
							'<div class="rTitle" style="text-align:center;"><div>'+item.reviewTitle+'</div></div>'+
							'<div class="rContent">'+item.reviewContent+'</div>'+
							'<div class="rPoint" style="text-align:center;"><div style=" margin-top:15px;">'+item.reviewPoint+'</div></div>'+
							'<div class="rUser" style="text-align:center;">'+item.userId+'</div>'+
						'</div>'
					)
				});
				$("#reviewShow").append('<div style="height:20px;"></div>')
				
			},
			error:function(){alert("불러오기 실패")}
		})
	}
</script>
<style>
.allImg{
	margin-bottom:10px;
	margin-left:30px;
	width:150px;
	height:150px;
	border-radius:20px;
}
#imgResult{
	margin-top:20px;
	border-style:solid;
	border-width:2px;
	width:750px;
	height:250px;
	border-radius:10px;
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
.rPoint{
width:100px;
	border-style:solid;
	border-width:0 2px 0 0;
	border-color:#cfcfcf;
}
.rUser{
width:100px;
	
}

.radiobox{
	margin-left:50px;
	margin-top: 10px;
}
.reviewBtn{
	height:95px;
	

	border-width:0px;
	background-color: #befaf5;
}
.reviewInput{
	margin-left:30px;
	border-radius:10px;
	width:120px;
	height:40px;
	font-size:15px;
}
.reviewText{
	margin-left:30px;
	border-radius:10px;
	font-size:15px;
}
#reviewShow{
	border-radius:10px;
	margin-top:20px;
}
.myLocation{
	border-radius:10px;
	height:40px;
	background-color:black;
	color:white;
	font-size:20px;
	margin-left:215px;
	margin-top:25px;
}
.admin{
	border-radius:20px;
	margin-top:20px;
	border-style:solid;
}
.book{
	border-style:solid;
	height:300px;
	width:500px;
}
#map{
	border-radius:10px;
	height:250px;
	width:250px;
	margin-left:20px;
	margin-top:20px;
}
.body{
width:750px;
}
.marketInfo{
	width:480px;
	border-radius:10px;
	margin-top:10px;
	border-style:solid;
	font-size:18px;
}
.bookBtn{
	margin-top:20px;
	margin-left:150px;
	width:150px;
	height:60px;
	font-size:30px;
	border-radius:20px;
}
.blog{
	margin-top:20px;
	border-style:solid;
	height:300px;
	border-radius:10px;
	
}
.blog2{
	margin-top:20px;
	border-style:solid;
	border-radius:10px;
	
}
#menuList{
	font-size:20px;
	margin-left:70px;
}
.main{
	width:750px;
	display:inline-flex;
}
</style>
</head>
<body>
<div class="body3">
<div class="body2">
	<div class="body">
	<jsp:include page="/WEB-INF/views/headLine.jsp" flush="false"></jsp:include>
	<c:if test="${message!=null}">
	<script>alert("${message}")</script>
	</c:if>
	<div class="main">
	<div style="display:block;">
		<div style="width:480px; height:60px;display:inline-flex;">
		<h1>${Market.marketName}</h1>
		<input type="button" value="Where am I?" onclick="getLocation()" class="myLocation">
		</div>
		<div class="marketInfo" style="height:174px;">
		<table style="margin-top:30px;">
	<tr>
	<th width="150px" >ReviewPoint</th><td > 5/${Market.marketPoint}</td>
	</tr>
	<tr>
	<th width="150px">OpenTime</th><td width="150px">${TimeTable.open}</td>
	<th width="150px">CloseTime</th><td width="150px">${TimeTable.close}</td></tr>
	<tr>
	<th width="150px">BreakTimeStart</th><td> ${TimeTable.breakTime} </td><th width="150px">BreakTimeStart</th><td> ${TimeTable.breakTimeEnd}</td>
	</tr>
	<tr>
	<th width="150px">MaxPrice</th><td id="maxP"></td><th width="150px">MinPrice</th><td id="minP"></td>
	</tr>
	</table>
	
	</div>
	</div>
	<div id="map"></div>
	</div>
	
	

	<div class="blog">
		<h1 style="text-align:center;">${Market.marketTitle}</h1>
		<p style="margin-left:20px">${Market.marketContent}</p>
	</div>
	
	
	<div class="blog2">
		<h1 style="text-align:center;" onclick="menuSelect(${Market.marketSeq})" id="h1tag">Menu 더보기</h1>
		<table id="menuList"></table>
	</div>
	<div id="imgResult"><h2 style="text-align:center;">사진첩</h2></div>
	<div style="display:inline-flex;">
	<input type="button" onclick="getBookPage(${Market.marketSeq})" value="예약하기" class="bookBtn">
	<input type="button" value="Review" class="bookBtn" id="reviewGo">
	</div>
	
	<div id="reviewShow"></div>
	
	 
	 
    <script>
    var Locations = [];
    var LocationName = [];
    var myLocation;
    
    function getLocation() {
		  if (navigator.geolocation) { // GPS를 지원하면
		    navigator.geolocation.getCurrentPosition(function(position) {
		    	Locations.push(new google.maps.LatLng(position.coords.latitude , position.coords.longitude))
		 		LocationName.push('내 위치')
		 		initMap();
		    }, function(error) {
		      console.error(error);
		    }, {
		      enableHighAccuracy: false,
		      maximumAge: 0,
		      timeout: Infinity
		    });
		  } else {
		    alert('GPS를 지원하지 않습니다');
		  }
		  
	}
      var map;
      function initMap() {
		  var markLocation = new google.maps.LatLng('${Market.lat}', '${Market.lng}');
		  Locations.push(markLocation);
		  LocationName.push("${Market.marketName}");
		  
        map = new google.maps.Map(document.getElementById('map'), {
          center: markLocation,
          zoom: 17
        });
		var contentString = '<div style="width:100px;height:50px;">${Market.marketName}</div>';		// 말풍선 내용
		for(var i = 0 ; i<Locations.length;i++){
        var marker = new google.maps.Marker({
			position: Locations[i],
			map: map, 
		    draggable:false,			// 마커 드래그 가능
			title: LocationName[i]	// 마커 : 도움말 풍선(마우스 오버 시)
		});
      }
        var infowindow = new google.maps.InfoWindow({
			content: contentString,
			size: new google.maps.Size(200,100)
		});
       
		
        google.maps.event.addListener(marker, 'click', function() {
			infowindow.open(map, marker);
			
			if (marker.getAnimation() != null) {
				marker.setAnimation(null);
			} else {
				marker.setAnimation(google.maps.Animation.BOUNCE);
			}
		});
      }
    </script>
  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCPQcNl6uXAj4fNT55HtRdCALl5frjiqKU&callback=initMap"
  type="text/javascript"></script>
  	
  	<c:if test="${sessionScope.admin!=null}">
		<div class="admin">
		<h1 style="text-align: center;">관리자 매뉴</h1>
		<form action="marketImgInsert" method="post" enctype="multipart/form-data">
		<input type="file" name="uploadFile" style="margin-left:50px;">
		<input type="hidden" value="${Market.marketSeq}" name="marketSeq">
		
		<input type="submit" value="저장하기">
		</form>
		
		<form id="menuInsertForm">
			<table style="margin-left:30px;">
				<tr><th height="30px" width="150px">메뉴 이름</th><th height="30px" width="150px">메뉴 종류</th><th height="30px" width="150px">메뉴 가격</th>
				</tr>
				<tr>
				<th height="30px" width="150px"><input type="text" placeholder="Menu Name" name="menuName"></th><th height="30px" width="150px"><input type="text" placeholder="Menu Kind" name="menuKind"></th><th height="30px" width="150px"><input type="number" name="menuprice" placeholder="Price"></th>
				</tr>			
			</table>
			
			
			<input type="hidden"  name="marketSeq" value="${Market.marketSeq}">
			
		</form>
			<input type="button" style="margin-left:50px;" id="menuInsert" onclick="menuInsert()" value="메뉴등록">
		

		</div>
	</c:if>
	</div>	
 	<jsp:include page="/WEB-INF/views/CopyRight.jsp" flush="false"></jsp:include>
  </div>
 </div>
</body>
</html>