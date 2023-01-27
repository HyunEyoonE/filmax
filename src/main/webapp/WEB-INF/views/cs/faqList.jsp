<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="/resources/js/jquery-3.6.1.min.js"></script>
<h1></h1>

  			


	<%-- 리스트 --%>
<table class="table">
	<tr>
		<th>글번호</th><th>유형</th><th>제목</th><th>문의자명</th>
	</tr>
	<c:forEach var="faqDTO" items="${faqList}">
		<tr>
			<td>
				${faqDTO.faq_seq}
			</td>
			<td>
				${faqDTO.typeName}
			</td>
			<td>
				<a href="/cs/faqRead?num=${faqDTO.faq_seq}">
					${faqDTO.title}
				</a>
			</td>
			<td>
				${faqDTO.writer}
			</td>
		</tr>
	</c:forEach>
	
</table>
<center>
<c:forEach var="i" begin="1" end="${pageCount}" step="1">
				<a href="/cs/faqList?pageNum=${i}">[${i}]</a>
	</c:forEach>
</center>
<input type="button" value="글쓰기" onclick="window.location='/cs/faqForm'">
