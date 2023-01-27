<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
		$(function(){
			// 지역클릭시 그 지역 안에 있는 지점들 불러오는 함수
			$(".btn-region").on('click',function(){
				region = event.target.id;
				console.log(region);
				
				$.ajax({
					type: "get",
					url: "/ticket/branchName",
					data: { regionName:region, movieId: '${movie}' },
					success: function(value){
						console.log(value);
						$("#branchList").html(value);
					}
				});	
			});
		});
</script>

<div id="regionList">
	<c:forEach var="dto" items="${regionList}" varStatus="status">
		<button type="button" class="btn-region" id="${dto.region}">${dto.region}(${dto.num})</button>
	</c:forEach>
</div>

