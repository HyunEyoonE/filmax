<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
		$(function(){
			var cinema = document.getElementById("selected-cinema");
			cinema.innerHTML = '<span>${roomNum}관</span>'+'<span>[${cinemaTypeName}관]</span>';
			
			$(".btn-selectSeat").on('click',function(){
				location.href='/ticket/selectedCinema?timetableId=${timetableSeq}';	
			});
		})
	
	</script>

<button type="button" class="btn-selectSeat">좌석선택 </button>

