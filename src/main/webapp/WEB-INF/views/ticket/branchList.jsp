<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
	<meta charset="UTF-8">

	<script src="/resources/js/jquery-3.6.2.min.js"></script>
	<script>
	$(function(){
		$(".btn-branch").on('click',function(){
			branch = event.target.id;
			var branchname = event.target.value;
			var clickedBranch = document.getElementById("selected-branch");
			//console.log('branchID:'+branch);
			
			clickedBranch.innerHTML = branchname;
			
			$.ajax({
				type: "get",
				url: "/ticket/selectedBranch",
				data: { branchId: branch, movieId: '${movie}' },
				success: function(value){
					// $("#timetableList").html(value);
					// console.log(value);
					$("#dateList").html(value);
				}
			});	
		});
		
		
	})
	
	</script>
	
</head>

<div id="branchList">
		<c:forEach var="dto" items="${branchList}" varStatus="status">
			<button type="button" class="btn-branch" id="${dto.branch_seq}" value="${dto.branchName}">${dto.branchName}</button>
		</c:forEach>
	</div>
