<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="/resources/js/jquery-3.6.1.min.js"></script>
<script>
	$(function(){
		$("#backList").click(function(){
			location.href="/cs/groupcsList";
		});
		//날짜 검색 유효성 검사
		$("#dateSearch").submit(function(){
			if($("#startDate").val() == "") {
				alert("날짜를 선택해주세요");
				$("#startDate").focus();
				return false;
			}
			if($("#endDate").val() == "") {
				alert("날짜를 선택해주세요");
				$("#endDate").focus();
				return false;
			}	
		});
		//검색 유효성 검사
		$("#searchForm").submit(function(){
			if($("#cValue").val() == "") {
				alert("검색할 단어를 입력해주세요");
				$("#cValue").focus();
				return false;
			}	
		});
	});
</script>

<h1>단체/대관 문의</h1>
<%-- 목록으로 돌아가기 --%>
<input type="button" id="backList" value="목록으로 돌아가기"/>
<%-- 정렬 순서 select --%>
<select id="orderNum">
	<option>정렬 선택</option>
	<option value="0">최신순</option>
	<option value="1">작성순</option>
</select>

<%-- 답변 미완료 수 --%>
전체 미완료 답변: <b>${countNotAnswered} 건</b>
<%-- 날짜 검색 --%>
<form id="dateSearch" action="/cs/groupcsDateSearch" method="get">
	<input type="date" id="startDate" name="startDate"/> ~
	<input type="date" id="endDate" name="endDate"/>
	<input type="hidden" name="dateSearch" value="1"/>
	<input type="submit" value="검색"/>
</form>
<%-- 리스트 --%>
<table class="table">
	<tr>
		<th>#</th><th>영화관</th><th>문의자명</th><th>등록일</th><th>답변여부</th>
	</tr>
	<c:forEach var="groupcsDTO" items="${groupList}">
		<tr>
			<td>
				${groupcsDTO.groupcs_seq}
			</td>
			<td>
				<a href="/cs/groupcsRead?num=${groupcsDTO.groupcs_seq}">
					${groupcsDTO.branchName}
				</a>
			</td>
			<td>
				${groupcsDTO.csname}
			</td>
			<td>
				<fmt:formatDate value="${groupcsDTO.reg}" type="date"/>
			</td>
			<td>
				<c:choose>
					<c:when test="${groupcsDTO.isanswered == 0}">
						<font color="red">미완료</font>
					</c:when>
					<c:otherwise>
						완료
					</c:otherwise>
				</c:choose>
				
			</td>
		</tr>
	</c:forEach>
</table>
<%-- 페이지 이동 --%>
<center>
	<c:if test="${currPage > 1}">
		<a href="/cs/groupcsDateSearch?startDate=${startDate}&endDate=${endDate}&pageNum=${currPage-1}">[이전]</a>
	</c:if>
	<c:forEach begin="1" end="${pageCount}" step="1" var="pageIndex">
		<a href="/cs/groupcsDateSearch?startDate=${startDate}&endDate=${endDate}&pageNum=${pageIndex}">${pageIndex}</a>
	</c:forEach>
	<c:if test="${currPage < pageCount}">
		<a href="/cs/groupcsDateSearch?startDate=${startDate}&endDate=${endDate}&pageNum=${currPage+1}">[다음]</a>
	</c:if>
</center>
<%-- 검색창 --%>
<form id="searchForm" method="get" action="/cs/groupcsSearch">
	<select id="cName" name="cName">
		<option value="csname">문의자명</option>
		<option value="phone">휴대폰번호</option>
		<option value="email">이메일</option>
		<option value="region">지역</option>
	</select>
	<input type="text" id="cValue" name="cValue"/>
	<input type="submit" value="검색"/>
</form>