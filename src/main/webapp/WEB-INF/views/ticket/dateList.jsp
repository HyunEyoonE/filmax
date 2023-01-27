<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
	<meta charset="UTF-8">

	<script src="/resources/js/jquery-3.6.2.min.js"></script>
	<script>
		$(function(){
			$(".btn-date").on('click',function(){
				dateStr = event.target.id;
				var clickedDate = document.getElementById("selected-date");
				clickedDate.innerHTML = dateStr;
				//console.log('date: '+date);

				$.ajax({
					type: "get",
					url: "/ticket/selectedDate",
					data: { branchId: '${branch_seq}', 
							movieId: '${movie_seq}',
							dateString: dateStr
							},
					success: function(value){
						// $("#timetableList").html(value);
						// console.log(value);
						$("#timeList").html(value);
					}
				});	
			});
		})
	
	</script>
</head>

<c:forEach var="dto" items="${dateList}" varStatus="status">
	<button type="button" class="btn-date" id="${dto.screenDate}">${dto.screenDate}</button>
</c:forEach>

