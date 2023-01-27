<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="/resources/js/jquery-3.6.1.min.js"></script>
<script>
	$(function(){
		$("#replyReadBtn").click(function(){
			$("#readReplyDiv").css("display", "block");
		});
		$("#replySendBtn").click(function(){
			$("#sendReplyDiv").css("display", "block");
		});
	});
</script>

<h1>/cs/groupcsRead</h1>
<table class="table">
	<tr>
		<td>
			이름: ${groupcsDTO.csname}
		</td>
		<td>
			휴대전화: ${groupcsDTO.phone}
		</td>
		<td>
			이메일: ${groupcsDTO.email}
		</td>
	</tr>
	<tr>
		<td>
			지역: ${groupcsDTO.region}
		</td>
		<td colspan="1">
			지점: ${groupcsDTO.branchName}
		</td>
		<td colspan="1">
			영화관 타입: ${groupcsDTO.cinemaTypeName}
		</td>
	</tr>
	<tr>
		<td colspan="3">
			작성일: <fmt:formatDate value="${groupcsDTO.reg}" type="date"/>
		</td>
	</tr>
	<tr>
		<td colspan="3">
			${groupcsDTO.content}
		</td>
	</tr>
</table>
<%--
	답변 가져오기
	없으면 작성하기
--%>
<c:choose>
	<c:when test="${groupcsDTO.isanswered == 1}">
		<input type="button" id="replyReadBtn" value="답장 확인하기"/>
	</c:when>
	<c:otherwise>
		<input type="button" id="replySendBtn" value="답장하기"/>
	</c:otherwise>
</c:choose>
<%-- 답장하기 --%>
<div id="sendReplyDiv" style="display:none;">
	<form action="/cs/groupcsReplyPro" method="post">
		<table class="table">
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="title"/>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="20" cols="80" id="content" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="메일 발송" />
				</td>
			</tr>
		</table>
		<input type="hidden" name="groupcs_seq" value="${groupcsDTO.groupcs_seq}"/>
		<input type="hidden" name="email" value="${groupcsDTO.email}"/>
		<%-- 로그인 붙인 후 수정 --%>
		<input type="hidden" name="writer" value="testWriter"/>
	</form>
</div>
<%-- 답장 확인하기 --%>
<div id="readReplyDiv" style="display:none;">
	<table class="table">
		<tr>
			<th colspan="2"> 제목 </th>
		</tr>
		<tr>
			<td>작성자: ${greplyDTO.writer}</td>
			<td>메일 발송일: <fmt:formatDate value="${greplyDTO.reg}" type="date"/></td>
		</tr>
		<tr>
			<td colspan="2">${greplyDTO.content}</td>
		</tr>
	</table>
</div>