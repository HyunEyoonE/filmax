<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="/resources/js/jquery-3.6.1.min.js"></script>
<h1>자주찾는 질문</h1>

<script>
	$(function(){
		//타입검사
		$("#faqRead").submit(function(){
			
			if($("#type").val() == ""){
				$("#type").val() = 0;	
			}
			console.log($("#faqtype").val());
			
		});
	});
</script>

<form action="/cs/newsUpdate" method="post" id="newsRead">
<table class="table table-hover">
	<tr>
		<th>
			<select name="newstype" id="newstype">
				<option>${dto.typename}</option>
				<c:forEach var="newsTypeDTO" items="${newsTypeDTOList}">
					<option value="${newsTypeDTO.num}">${newsTypeDTO.name}</option>
				</c:forEach>
			</select>
			<input type="hidden" name="orgTypeValue" value="${dto.type}"/>
			<input type="hidden" name="news_seq" value="${dto.news_seq}"/>
		</th>
		<th><input type="text" name="title" value="${dto.title}" /></th>
		<th>등록일 <fmt:formatDate value="${dto.reg}" type="date"/>  </th>
		<th><input type="text" name="writer" value="${dto.writer}"/></th>
	</tr>
	<tr>
		<td colspan="5"><textarea name="content" row="20" cols="80" >${dto.content}</textarea></td>
	</tr>
	<tr>
		<td>
			<input type="button" value="삭제" onclick="window.location='/cs/newsDelete?num=${dto.news_seq}'"/>
			<input type="submit" value="수정"/>
			<input type="button" value="목록으로" onclick="window.location='/cs/newsList'"/>
		</td>
	</tr>
</table>
</form>

