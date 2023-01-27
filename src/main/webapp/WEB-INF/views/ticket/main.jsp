<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script src="/resources/js/jquery-3.6.2.min.js"></script>

<!-- 영화 리스트 -->
	<c:forEach var="dto" items="${movieList}">
		<button type="button" class="btn-movie" id="${dto.movie_seq}" value="${dto.title}">${dto.title}</button>
	</c:forEach>
	<br /><br />
	
	<div id="regionList">
	<c:forEach var="dto" items="${regionList}" varStatus="status">
		<button type="button" class="btn-region" id="${dto.region}">${dto.region}(${dto.num})</button>
	</c:forEach>
</div>

	
	<!-- branch 리스트 -->
	<div id="branchList">
		<c:forEach var="dto" items="${branchList}" varStatus="status">
			<button type="button" class="btn-branch" id="${dto.branch_seq}" value="${dto.branchName}">${dto.branchName}</button>
		</c:forEach>
	</div>
	
	<!-- cinema, timetable 리스트 -->
	<div id="dateList"></div>

	<div id="timeList"></div>
<br/><br/>

<div id="select-seat"></div>
<div id="select-detail">
	<h3>영화 </h3>
	<div id="selected-movie"></div>
	<h3>극장 </h3>
	<div id="selected-branch"></div>
	<h3>일시 </h3>
	<div id="selected-date"></div>
	<div id="selected-time"></div>
	<h3>상영관 </h3>
	<div id="selected-cinema"></div>
</div>
	
<script src="/resources/js/ticket.js"></script>
