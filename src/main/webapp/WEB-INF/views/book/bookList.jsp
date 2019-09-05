<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
#calendar{
	margin-top:30px;
	width:750px;
}
.calText{
	margin-top:30px;
	text-align:center;
	background-color:#d3e3f2;
	color:black;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/test/resources/js/jquery-3.4.1.js"></script>
 <link href='/test/resources/fullcalendar/core/main.css' rel='stylesheet' />
    <link href='/test/resources/fullcalendar/daygrid/main.css' rel='stylesheet' />

    <script src='/test/resources/fullcalendar/core/main.js'></script>
    <script src='/test/resources/fullcalendar/daygrid/main.js'></script>
    <script>	
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
          plugins: [ 'dayGrid' ]
        });

        calendar.render();
      });
   
      
     
      function calInsert(bookDate,marketName){
    	  
    	  $(".fc-day").each(function(i,item){
    		 flag = item.getAttribute("data-date")
    		  if(item.getAttribute("data-date")==bookDate){
    			
    		  	item.innerHTML = '<div class="calText">'+marketName+'<br></div>'
    	
    		  	
    		  	}
    	  })
      }
      $(function(){
    	  $(".fc-right").css("display","none")
    	  getList();
    	  function getList(){
      <c:forEach items="${bList}" var="book">
		calInsert("${book.bookDate}","${book.marketName}","${book.people}","${book.userName}")
	  </c:forEach>
    	  }
    	  
      })
      

    </script>
</head>
<body>
<div class="body3">
<div class="body2">
	<div class="body">
	<jsp:include page="/WEB-INF/views/headLine.jsp" flush="false"></jsp:include>
	<div id='calendar'></div>
	</div>
	<jsp:include page="/WEB-INF/views/CopyRight.jsp" flush="false"></jsp:include>
	</div>
</div>	
</body>
</html>