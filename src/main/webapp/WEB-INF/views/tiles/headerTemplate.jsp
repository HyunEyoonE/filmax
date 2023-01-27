<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<!-- Header Section Begin -->
    <header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="header__logo">
                        <a href="/main/home">
                            <img src="/resources/main/filmaxlogo.png" height="35" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li class="active"><a href="/ticket/">예매하기</a></li>
                                <li><a href="/movies/movies_Chart">영화 차트</a></li>
                                <li><a href="/cs/main">고객센터</a></li>
                                <li><a href="/member/main">마이페이지 <span class="arrow_carrot-down"></span></a>
                                    <ul class="dropdown">
                                        <li><a href="/member/myCouponList">할인쿠폰</a></li>
                                        <li><a href="/member/myPointList">포인트</a></li>
                                        <li><a href="/member/update">회원정보</a></li>
                                        <c:choose>
                                        	<c:when test="${(sessionScope.uid == null) == (sessionScope.nid == null)}">
                                        		<li><a href="/member/loginForm">로그인</a></li>	
                                        	</c:when>
                                        	<c:otherwise>
                                        		<li><a href="/member/logout">로그아웃</a></li>
                                        	</c:otherwise>
                                        </c:choose>
                                        
                                    </ul>
                                </li>
                                
                                
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="header__right">
                        <a href="#" class="search-switch"><span class="icon_search"></span></a>
                        <a href="/member/loginForm"><span class="icon_profile"></span></a>
                    </div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>
    <!-- Header End -->