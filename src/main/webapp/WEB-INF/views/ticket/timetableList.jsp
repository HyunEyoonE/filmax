<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script src="/resources/js/jquery-3.6.2.min.js"></script>
<script>
	$(function(){
		$(".btn-time").on('click',function(){
			date = event.target.id;
			var clickedDate = document.getElementById("selected-date");
			clickedDate.innerHTML = date;
			//console.log('date: '+date);
			
			
		});
		
	})

</script>

<c:forEach var="dto" items="${timetableList}" varStatus="status">
	<button type="button" class="btn-time" id="${dto.screenDate}">${dto.screenDate}</button>
</c:forEach>


