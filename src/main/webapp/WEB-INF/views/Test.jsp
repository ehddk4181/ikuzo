<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="/test/resources/js/jquery-3.4.1.js"></script>
<script>
	$(function() {
		$("#btn1").click(test);
		$("#btn2").click(test2);
		$("#btn3").click(test3);
		$("#btn4").click(test4);
	})
	function test() {
		$.ajax({
			url : "test",
			type : "post",
			contentType : "application/json; charset=utf-8",
			data : JSON.stringify({
				"id" : $("#id").val(),
				"name" : $("#name").val()
			}),
			success:function(){alert("성공")},
			error:function(){alert("실패당")}
		})
	}
	function test2() {
		$.ajax({
			url : "test2",
			type : "get",
			data : $("#test2").serialize(),
			success:function(){alert("성공")},
			error:function(){alert("실패당")}
		})
	}
	var temp;
	function test3() {
		$.ajax({
			url : "test3",
			type : "post",
			dataType:"json",
			
			success:function(result){
				//result = 제이슨으로 변형된 return 값
				temp = result;
				$(result).each(function(index,item){
					$("#here").append(
							"<tr><td>" + item.id + "</td><td>" + item.name + "</td></tr>"
							)
				})
			},
			error:function(){alert("실패당")}
		})
	}
	function test4() {
		var form = $("#upload")[0];
		var formData= new FormData(form);
		$.ajax({
			url : "test4",
			type : "post",
			data:formData,
			contentType: false,
			processData: false,
			success:function(){alert("성공")},
			error:function(){alert("실패당")}
		});
	}
</script>
<body>
	<div>
		<table id="here" border="solid">
			<tr>
				<th>ID</th>
				<th>NAME</th>
			</tr>
		</table>	
	</div>
	<input type="button" value="버튼1" id="btn1"><br>
	<input type="button" value="버튼2" id="btn2">
	<input type="button" value="버튼3" id="btn3">
	<input type="text" value="버튼1" id="id">
	<input type="text" value="버튼1" id="name">
	<br>
	<form id="test2">
		<input type="text" value="버튼1" name="id">
		<input type="text" value="버튼1" name="name">
	</form>
	<hr>
	<form id="upForm">
		<input type="text" value="버튼1" name="id">
		<input type="text" value="버튼1" name="name">
		<input type="file"  name="upload">
		<input type="button" value="파일전송" id="btn4">
	</form>
	
	

</body>
</html>