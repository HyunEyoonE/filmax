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
				<a href="/member/myCouponList">	<div class="csMainMenu">관람권/할인쿠폰</div></a>
				<a href="/member/myPointList">	<div class="csMainMenuHome">포인트</div></a>
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
		<h3>내포인트</h3>
		<h4>아이디 : ${sessionScope.uid}</h4>
		
		<c:if test="${sessionScope.uid == null}">
			<script>
				alert("로그아웃 되었습니다. 다시 로그인해주세요");
				window.location="/member/loginForm";
			</script>
		</c:if>
		
		<c:if test="${sessionScope.uid != null}">
		<table border="1">
			<tr>
				<td>번호</td>
				<td>상세정보</td>
				<td>적 립</td>
				<td>사 용</td>
				<td>현재포인트</td>
				<td>날짜</td>
			</tr>
			<c:forEach items="${myplist}" var="dto">
			<tr>
				<td>${dto.num}</td>
				<td>${dto.pointinfo}</td>
				<td>${dto.pluspoint}p</td>
				<td>${dto.usepoint}</td>
				<td>${dto.totalpoint}</td>
				<td><fmt:formatDate value="${dto.usedate}" type="date"/></td>
			</tr>
			</c:forEach>
		</table>
		</c:if>
	</div>
</div>