<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="initial-scale=1.0">
<title>Insert title here</title>
<style>
#map{
	margin-top:20px;
	height:300px;
	width:750px;
	border-radius:30px;

}
.tdTag{
	text-align:center;
	font-size:20px;
}
.inputT{
	width:200px;
	height:40px;
	font-size:20px;
	border-style:solid;
	border-color:#dbdbdb;
	border-width:0 0 2px 0;
}
.body{
	width:750px;
}
.buttons{
	width:300px;
	height:80px;
	font-size:30px;
	border-radius:20px;
	background-color:#dbdbdb;
	border-style:solid;
	margin-left:200px;
	margin-top:20px;
}
.buttons:hover{
	background-color: #bababa;
}
</style>
<script src="/test/resources/js/jquery-3.4.1.js"></script>
<script>
	function placeMarker(place) {
		document.getElementById("lat").value = place.lat();
		document.getElementById("lng").value = place.lng();
	}
	function updateGo() {
		if(document.getElementById("lat").value!=""){
			if(document.getElementById("lng").value != ""){
				if(confirm("저장 하시겠습니까?")){
					$("#insertForm")[0].submit();
				};
			}
		}else{
			alert("지도를 한번 눌러주세용")
		}
	}
	function checkedAll(){
	var a = true;
	var b = true;
		$("td>*").each(function(i,item){
			if(item.value==""){
				alert("입력값을 확인하세요.")
				a = false;
				return false;
			}
		})
		if(a){
		updateGo()
		}
		
	}

</script>
</head>
<body>
<div class="body3">
<div class="body2">
	<div class="body">
	<jsp:include page="/WEB-INF/views/headLine.jsp" flush="false"></jsp:include>
	
	<h1> 가게 생성 하기</h1>
	<form action="marketInsert" method="Post" enctype="multipart/form-data" id="insertForm">
	<input type="hidden" name ="lat" id = "lat">
	<input type="hidden" name ="lng" id = "lng">
	<table>
		<tr>
			<th width="250px" height="40px" class="tdTag">가게 이름</th>
			<th width="250px" height="40px" class="tdTag">가게 머릿글</th>
			<th width="250px" height="40px" class="tdTag">가게 예약 정원</th>
		</tr>
		<tr>
			<td width="250px" height="40px" class="tdTag"><input type="text" name ="marketName" placeholder ="MarketName" class="inputT"></td>
			<td width="250px" height="40px" class="tdTag"><input type="text" name ="marketTitle" placeholder ="MarketTitle" class="inputT"></td>
			<td width="250px" height="40px" class="tdTag"><input type="number" name ="marketBookLimit" placeholder ="MarketBookLimit" class="inputT"></td>
		</tr>
	</table>
		<h3 style="text-align:center;">가게 게시글</h3>
		<textarea cols="80" rows="7" name ="marketContent" placeholder ="MarketContent" style="margin-top:20px; margin-left:90px;"></textarea>
	<table>
		<tr>
			<th width="375px" height="40px" class="tdTag">가게 이름</th>
			<th width="375px" height="40px" class="tdTag">가게 예약 정원</th>
		</tr>
		<tr>
			<td width="375px" height="40px" class="tdTag"><select name="LocationNumber" class="inputT" style="height:50px;">
			<option value="" selected="selected" hidden="" value="">-위치 선택-</option>
			<option value=1>외부</option>
			<option value=0>내부</option>
		</select></td>
			
			<td width="375px" height="40px" class="tdTag"><select name="marketKind" class="inputT" style="height:50px;">
			<option value="" selected="selected" hidden="" >-메뉴 선택-</option>
			<option value="American">양식</option>
			<option value="Korean">한식</option>
			<option value="Japaness">일식</option>
			<option value="Chines">중식</option>
		</select></td>
		</tr>
	</table>
	<table>
		<tr>
			<th width="250px" height="40px" class="tdTag">OpenTime</th>
			<th width="250px" height="40px" class="tdTag">CloseTime</th>
			<th width="250px" height="40px" class="tdTag">RestDate</th>
		</tr>
		<tr>
			<td width="250px" height="40px" class="tdTag"><input type="time" name="open" class="inputT"></td>
			<td width="250px" height="40px" class="tdTag"><input type="time" name="close" class="inputT"></td>
			<td width="250px" height="40px" class="tdTag"><input type="date" name="rest" class="inputT"></td>
		</tr>
		<tr>
			<th width="250px" height="40px" class="tdTag">BreakTime Start</th>
			<th width="250px" height="40px" class="tdTag"></th>
			<th width="250px" height="40px" class="tdTag">BreakTime End</th>
		</tr>
		<tr>
			<td width="250px" height="40px" class="tdTag"><input type="time" name="breakTime" class="inputT"></td>
			<td width="250px" height="40px" class="tdTag"></td>
			<td width="250px" height="40px" class="tdTag"><input type="time" name="breakTimeEnd" class="inputT"></td>
			
		</tr>
	</table>	
		
	</form>
		<div id="map"></div>
		<input type="button" value="가게등록하기" onclick="checkedAll()" class="buttons" style="text-align: center;">
		</div>
		<jsp:include page="/WEB-INF/views/CopyRight.jsp" flush="false"></jsp:include>
	</div>
</div>
	<script>
      var map;
      function initMap() {
    	  var markLocation = new google.maps.LatLng('37.511601', '127.058623');
        map = new google.maps.Map(document.getElementById('map'), {
          center: markLocation,
          zoom: 15
        
        });
		var contentString = '<div style="width:100px;height:50px;">"클릭해줘요잉"</div>';		// 말풍선 내용

        var marker = new google.maps.Marker({
			position: markLocation,
			map: map, 
		    draggable:true,			// 마커 드래그 가능
			title: '가게 위치'	// 마커 : 도움말 풍선(마우스 오버 시)
		});
        var infowindow = new google.maps.InfoWindow({
			content: contentString,
			size: new google.maps.Size(200,100)
		});
        
        google.maps.event.addListener(marker, 'click', function(event) {
			infowindow.open(map, marker);
			placeMarker(event.latLng);
		});
      }
    </script>
  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCPQcNl6uXAj4fNT55HtRdCALl5frjiqKU&callback=initMap"
  type="text/javascript"></script>
  
</body>
</html>