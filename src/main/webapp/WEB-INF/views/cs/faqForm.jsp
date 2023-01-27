<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="/resources/js/jquery-3.6.1.min.js"></script>
<h1>faqForm</h1>

<form id="faqForm" action="/cs/faqFormPro" method="post">
	<table	class="table">
		<tr>
		<td>질문유형선택</td>
			<td>
				<select id="type" name="type">
					<option value="">질문유형</option>
					<c:forEach var="faqtypeDTO" items="${faqtype}">
						<option value="${faqtypeDTO.num}">${faqtypeDTO.name}</option>	
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>
				<input type="text" name="title"/>
			</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>
				<input type="text" name="writer"/>
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea name="content" row="20" cols="80"></textarea>
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="등록">
			</td>
		</tr>
	</table>	
</form>