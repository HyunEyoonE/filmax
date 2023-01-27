<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/resources/cs/css/main.css" type="text/css">

<div class="container">
	<!--네비게이션-->
	<div class="filmaxCsSidebarBox">
		<nav>
			<div style="float:left;">
				<a href="/member/main">			<div class="csMainMenuHome">마이페이지 메인</div></a>
				<a href="/member/main">			<div class="csMainMenu">예매내역</div></a>
				<a href="/member/myCouponList">	<div class="csMainMenu">관람권/할인쿠폰</div></a>
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
		<c:if test="${sessionScope.uid != null}">
			<div style="margin:0px; padding:10px;">
				<!-- <div style="margin:0px; padding:0px; float:left"> -->
					<div align=center style="width:200px; height:200px; backgroud-color:#FE2E2E; float:left; padding-top:20px;">
						<c:if test="${dto.profile == null}">
							<img src="http://img.cgv.co.kr/R2014/images/common/default_profile.gif" alt="" onerror="errorImage(this, {'type':'profile'})">
						</c:if>
						<c:if test="${dto.profile != null}">
							<img src="/resources/member/img/${dto.profile}" style="max-width: 80%; height: auto;">
						</c:if>
					</div>
			</div>
			<div>
				<h3>${dto.name}님 [${sessionScope.uid}] </h3>
				닉네임: <c:if test="${dto.nickname == null}">닉네임을 설정해주세요</c:if>
						<c:if test="${dto.nickname != null}">${dto.nickname}</c:if>
				<input type="button" value="변경" onclick="window.open('/member/profileEdit', '프로필 수정', 'width=500, height=500')">
			</div>
			<div>고객등급 : ${dto.levels_name}</div>
			<button onclick="window.location='/member/logout'">로그아웃</button>
		</c:if>
		
		<c:if test="${sessionScope.guestid != null}">
			<div>
				<h5>비회원 로그인[${sessionScope.guestid}]</h5>
				<button onclick="window.location='/member/logout'">로그아웃</button>
				<button onclick="window.location='/member/couponList'">쿠폰함</button>
			</div>
		</c:if>
		
		<c:if test="${sessionScope.uid == null}">
			<c:if test="${sessionScope.guestid == null}">
				<div>
					<button onclick="window.location='/member/loginForm'" class="btn btn-default">로그인</button>
					<button onclick="window.location='joinAgreement'" class="btn btn-default">회원가입</button>
					<button onclick="window.location='/member/guest/guestJoin'" class="btn btn-default">비회원 예매하기</button>
					<button onclick="window.location='/member/guest/loginForm'" class="btn btn-default">비회원 예매확인</button>
					<br/>
				</div>
			</c:if>
		</c:if>
		<c:if test="${sessionScope.uid == 'admin'}">
		<div>
			<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><h5>관리자용 페이지</h5>	
		</div>
		<div>
			<button onclick="window.location='http://localhost:7070/member/main'" class="btn btn-default">관리자 페이지</button>
			<button onclick="window.location='/cs/main'" class="btn btn-default">고객센터</button>
		</div>
		</c:if>
		<br/>
	</div>
</div>
