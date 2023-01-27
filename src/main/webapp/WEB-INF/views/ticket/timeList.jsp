<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script src="/resources/js/jquery-3.6.2.min.js"></script>
<script>
	$(function(){
		$(".btn-time").on('click',function(){
			time = event.target.id;
			var clickedTime = document.getElementById("selected-time");
			clickedTime.innerHTML = time;
			//console.log('date: '+date);
			
			$.ajax({
				type: "get",
				url: "/ticket/selectedAll",
				data: { branchId: '${branch_seq}', 
						movieId: '${movie_seq}',
						dateString: '${dateStr}',
						timeString: time
						},
				success: function(value){
					$("#select-seat").html(value);
					// console.log(value);
					$("#select-");
				}
			});	
		
		});
		
	})

</script>

<c:forEach var="dto" items="${timeList}" varStatus="status">
	<button type="button" class="btn-time" id="${dto.screenTime}" value="${dto.timetable_seq}">${dto.screenTime}</button>
</c:forEach>

