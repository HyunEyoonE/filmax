<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<h3>공지 뉴스</h3>
		<p>CGV의 주요한 이슈 및 여러가지 소식들을 확인하실 수 있습니다.</p>
			
			<a href="/cs/newsList">전체</a>
			<c:forEach var="typeDTO" items="${type}">
				<a href="/cs/newsList?newstype=${typeDTO.num}">${typeDTO.name}</a>
			</c:forEach>
				
		<div>	
			<table class="table table-hover">
				<tr>
					<th>글번호</th>
					<th>타입</th>
					<th>제목</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
				
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>[${dto.news_seq}]</td>
						<td>[${dto.typeName}]</td>
						<td><a href="/cs/read?num=${dto.news_seq}">[${dto.title}]</a></td>
						<td><fmt:formatDate value="${dto.reg}" type="date"/></td>
						<td>[${dto.readcount}]</td>
					</tr>
				</c:forEach>
				
			</table>
		</div>
		
		<center>
		<c:set var="pageCount" value="${count/pageSize + (count % pageSize == 0 ? 0 : 1)}"/>
		<c:set var="pageBlock" value="${15}"/>
		<fmt:parseNumber var="result" value="${pageNum/15}" integerOnly="true"/>
		<c:set var ="startPage" value="${result * 15 +1}"/>
		<c:set var ="endPage" value="${startPage+pageBlock-1}"/>
		
		<c:if test="${endPage>pageCount}">
			<c:set var="endPage" value="${pageCount}"/>
		</c:if>
		
		<c:if test="${startPage > 15}">
			<a href="/cs/newsList/pageNum=${startPage-15}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="/cs/newsList?pageNum=${i}">[${i}]</a>
		</c:forEach>
		
		<div>
			<form action="/cs/searchList" autocomplte="off">
				<select name="search">
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
				<input type ="text" name="searchValue"/>
				<input type="submit" value="검색"/>
			</form>
		</div>
		<br/>
		</center>
	</div>
</div>
