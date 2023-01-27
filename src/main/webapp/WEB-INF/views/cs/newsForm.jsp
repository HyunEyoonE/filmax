<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="/resources/js/jquery-3.6.1.min.js"></script>

<form id="newsForm" action="/cs/newsFormPro" method="post">
	<table	class="table">
		<tr>
		<td>타입선택</td>
			<td>
				<select id="type" name="type">
					<option value="">타입유형</option>
					<c:forEach var="newstypeDTO" items="${newstype}">
						<option value="${newstypeDTO.num}">${newstypeDTO.name}</option>	
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