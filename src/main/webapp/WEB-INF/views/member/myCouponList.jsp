<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="/resources/cs/css/main.css" type="text/css">

<div class="container">
	<!--네비게이션-->
	<div class="filmaxCsSidebarBox">
		<nav>
			<div style="float:left;">
				<a href="/member/main">			<div class="csMainMenu">마이페이지 메인</div></a>
				<a href="/member/main">			<div class="csMainMenu">예매내역</div></a>
				<a href="/member/myCouponList">	<div class="csMainMenuHome">관람권/할인쿠폰</div></a>
				<a href="/member/myPointList">	<div class="csMainMenu">포인트</div></a>
				<a href="/member/main">			<div class="csMainMenu">이벤트 참여내역</div></a>
				<a href="/member/main">			<div class="csMainMenu">기프트샵</div></a>
				<a href="/member/update">		<div class="csMainMenu">회원정보</div></a>
				<a href="/member/update">		<div class="csMainMenu">프로필 관리</div></a>
				<a href="/cs/main">				<div class="csMainMenu">나의 문의내역</div></a>
				<a href="">						<div class="csMainMenu">내가 본 영화</div></a>
			</div>
		</nav>
	</div>
	<!--콘텐츠부분-->
	<div class="filmaxCsBodyContainer">
		<h3>나의쿠폰목록</h3><br/>
		<h4>아이디 : ${sessionScope.uid}</h4>
		<!-- <button onclick="window.location='/member/myCouponList'">쿠폰전체목록</button> -->
		<table border="1" style="text-align: center" class="table">
			<tr>
				<td>번호</td>
				<td>쿠폰종류</td>
				<td>쿠폰정보</td>
				<td>할인금액</td>
				<td>사용여부</td>
				<td>유효기간</td>
			</tr>
			<c:forEach items="${mylist}" var="dto">
			<tr>
				<td>${dto.num}</td>
				<td>${dto.name}</td>
				<td>${dto.info}</td>
				<td>${dto.sale}원</td>
				<c:if test="${dto.use=='true'}"><td>사용불가</td></c:if>
				<c:if test="${dto.use=='false'}"><td>사용가능</td></c:if>
				<td>~<fmt:formatDate value="${dto.usetime}" type="date"/>까지</td>
			</tr>
			</c:forEach>
		</table>
		<input type="button" value="취소" onclick="window.close()" class="btn btn-default"/>
	</div>
</div>





