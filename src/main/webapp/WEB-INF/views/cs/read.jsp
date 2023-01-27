<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/resources/cs/css/main.css" type="text/css">

<div class="container">
	<!--네비게이션-->
	<div class="filmaxCsSidebarBox">
		<nav>
			<div style="float:left;">
				<a href="/cs/main" ><div class="csMainMenu">고객센터 메인</div></a>
				<a href="/cs/faqList"><div class="csMainMenu">자주 찾는 질문</div></a>
				<a href="/cs/newsList"><div class="csMainMenuHome">공지/뉴스</div></a>
				<a href="/cs/emailCs"><div class="csMainMenu">이메일 문의</div></a>
				<a href="/cs/groupcs"><div class="csMainMenu">단체/대관 문의</div></a>
			</div>
		</nav>
	</div>
	<!--콘텐츠부분-->
	<div class="filmaxCsBodyContainer">
		<h3>공지/뉴스</h3>
		<table class="table table-hover">
			<tr>
				<th>[${dto.typeName}]</th>
				<th>[${dto.title}]</th>
				<th>등록일 <fmt:formatDate value="${dto.reg}" type="date"/>  </th>
				<th>조회수 ${dto.readcount}</th>
			</tr>
			<tr>
				<td colspan="5">${dto.content}</td>
			</tr>
		</table>
		
		<c:choose>
			<c:when test="${not empty dtoPrev.news_seq}">
				<a href="read?num=${dtoPrev.news_seq}">이전글${dtoPrev.title}</a>
			</c:when>
			<c:otherwise>
				이전글이없습니다.
			</c:otherwise>
		</c:choose>
		<br />
		
		<c:choose>
			<c:when test="${not empty dtoNext.news_seq}">
				<a href="read?num=${dtoNext.news_seq}">다음글${dtoNext.title}</a>
			</c:when>
			<c:otherwise>
				다음글이없습니다
			</c:otherwise>
		</c:choose>
		<br/>
		<button type="button" onclick="location.href='/cs/newsList'">목록으로</button>
	</div>
</div>