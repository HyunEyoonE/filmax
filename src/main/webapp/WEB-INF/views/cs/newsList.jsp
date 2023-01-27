<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="/resources/js/jquery-3.6.1.min.js"></script>
<h1></h1>

<%-- 리스트 --%>
<table class="table">
	<tr>
		<th>글번호</th><th>유형</th><th>제목</th><th>작성자</th>
	</tr>
	<c:forEach var="newsDTO" items="${newsList}">
		<tr>
			<td>
				${newsDTO.news_seq}
			</td>
			<td>
				${newsDTO.typename}
			</td>
			<td>
				<a href="/cs/newsRead?num=${newsDTO.news_seq}">
					${newsDTO.title}
				</a>
			</td>
			<td>
				${newsDTO.writer}
			</td>
		</tr>
	</c:forEach>
	
</table>
<center>
<c:forEach var="i" begin="1" end="${pageCount}" step="1">
				<a href="/cs/newsList?pageNum=${i}">[${i}]</a>
	</c:forEach>
</center>
<input type="button" value="글쓰기" onclick="window.location='/cs/newsForm'">