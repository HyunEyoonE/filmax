<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
	<meta charset="UTF-8">
	<title>예매 | 영상의 극한을 경험하다. FILMAX</title>

	<script src="/resources/js/jquery-3.6.2.min.js"></script>
	<script src="/resources/js/seat.js"></script>
	
	<link rel="stylesheet" href="/resources/css/seat.css" />
</head>

<div class="select-detail">

	<div class="container-movie">
		<span>영화| </span>
		<span>${selectedMovie.title}</span>
	</div>
	
	<div class="container-details">
		<div id="selected-branch">
			<span>극장| </span>
			<span>FILMAX ${selectedBranch.branchName}</span>
		</div>
		
		<div id="selected-date">
			<span>일시| </span>
			${selectedDateTime.screenDate}
			${selectedDateTime.screenTime}
		</div>
		<div id="selected-time">
			<span></span>
		</div>
		
		<div id="selected-cinema">
			<span>상영관| </span>
			<span>${selectedCinema.roomNum}관 [${selectedCinemaType.typeName} 타입]</span>
		</div>
	</div>
	
	<div class="container-seat">
		<span>인원| </span>
		<span id="numOfClickedPeople"></span>
		<div class="group-normal">
			<span class="title">일반 </span>
			<c:forEach begin="0" end="9" step="1" var="i">
				<button type="button" class="btn-numPeople" id="${i}">${i}</button>
			</c:forEach>
		</div>
		
		<span>좌석| </span>
		<span id="numOfClickedSeat"></span>
		
	</div>
	
	<div class="container-price">
		<span>총금액| </span>
		<span id="sumOfPrice"></span>
	</div>
</div>

<c:forEach var="dto" items="${seatList}" varStatus="status">
	<span>
		<input type="checkbox" class="ck-seat" id="${dto.seat_seq}" name="${dto.seat_seq}" value="${dto.seatName}"/>
		<label for="${dto.seat_seq}">${dto.seatName}</label>
	</span>
	<c:if test="${status.current.seatNum == 5}">
		<br />
	</c:if>
</c:forEach>
<br /><br />

<form action="/ticket/payout" method="post">
	<input type="hidden" name="total" id="total" />
	<input type="hidden" name="timetableId" value="${timetableId}" />
	<button type="submit" class="btn-payout">결제 </button>
</form>

