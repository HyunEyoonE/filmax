<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="/resources/js/jquery-3.6.1.min.js"></script>

<script>
	$(function(){
		$("#fileDownload").click(function(){
			var hrefLink = "http://localhost:7070/cs/emailcsDownload?num="+${emailcsDTO.emailcs_seq};
			location.href=hrefLink;
		});
		$("#replyReadBtn").click(function(){
			$("#readReplyDiv").css("display", "block");
		});
		$("#replySendBtn").click(function(){
			$("#sendReplyDiv").css("display", "block");
		});
	});
</script>

<h1>/cs/emailcsRead</h1>
<table class="table">
	<tr>
		<th colspan="3">
			[${emailcsDTO.etypeName}] ${emailcsDTO.title}
		</th>
	</tr>
	<tr>
		<td>
			이름: ${emailcsDTO.name}
		</td>
		<td>
			휴대전화: ${emailcsDTO.phone}
		</td>
		<td>
			이메일: ${emailcsDTO.email}
		</td>
	</tr>
	<c:if test="${emailcsDTO.thchoice == 1}">
		<tr>
			<td>
				지역: ${emailcsDTO.region}
			</td>
			<td colspan="2">
				지점: ${emailcsDTO.branchName}
			</td>
		</tr>
	</c:if>
	<tr>
		<td colspan="3">
			<c:choose>
				<c:when test="${empty emailcsDTO.files}">
					첨부파일 없음
				</c:when>
				<c:otherwise>
					<%-- 첨부파일 다운로드 미구현 --%>
					${emailcsDTO.files} <input type="button" id="fileDownload" value="첨부파일 받기"/>
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
	<tr>
		<td colspan="3">
			작성일: <fmt:formatDate value="${emailcsDTO.reg}" type="date"/>
		</td>
	</tr>
	<tr>
		<td colspan="3">
			${emailcsDTO.content}
		</td>
	</tr>
</table>
<%--
	답변 가져오기
	없으면 작성하기
--%>
<c:choose>
	<c:when test="${emailcsDTO.isanswered == 1}">
		<input type="button" id="replyReadBtn" value="답장 확인하기"/>
	</c:when>
	<c:otherwise>
		<input type="button" id="replySendBtn" value="답장하기"/>
	</c:otherwise>
</c:choose>
<%-- 답장하기 --%>
<div id="sendReplyDiv" style="display:none;">
	<form action="/cs/emailcsReplyPro" method="post">
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
		<input type="hidden" name="emailcs_seq" value="${emailcsDTO.emailcs_seq}"/>
		<input type="hidden" name="email" value="${emailcsDTO.email}"/>
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
			<td>작성자: ${ereplyDTO.writer}</td>
			<td>메일 발송일: <fmt:formatDate value="${ereplyDTO.reg}" type="date"/></td>
		</tr>
		<tr>
			<td colspan="2">${ereplyDTO.content}</td>
		</tr>
	</table>
</div>