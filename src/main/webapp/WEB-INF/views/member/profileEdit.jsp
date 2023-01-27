<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<head>
<h3>나의 프로필 수정</h3>
<title>프로필 수정</title>
<style>
	#update{
		border : 2px solid grey;
		width : 450px;
		height : 450px auto;
		margin: 20px auto;
	}
	*{
		box-sizing: border-box;
	
	}
</style>
<script>
	$(function(){ //닉네임 중복확인
		$("#nicknameCheck").click(function(){
			$.ajax({
				type: "get",
				url : "/member/nicknameCheck",
				data: {nickname:$("#nickname").val()},
				success : function(value){
					if(value == 1) {
						$("#result").css("color","red");
						$("#result").text("이미 사용중인 닉네임입니다.");
					}else {
						$("#result").css("color","green");
						$("#result").text("사용가능한 닉네임입니다.");
					}
				}
			});
		});
	});
</script>
</head>

<body>
<div id="updat">
<h4>${dto.name}님 [${sessionScope.uid}] </h4>

<form action="/member/profileEditPro" method="post" enctype="multipart/form-data">
<div>
	<input type="hidden" name="user_id" value="${dto.user_id}" />
	닉네임 :	한글, 영문, 숫자 혼용 가능(한글 기준 10자 이내)
</div>
<div>
	<input type="text" name="nickname" id="nickname" value="${dto.nickname}" />
	<input type="button" value="중복확인" id="nicknameCheck" class="btn btn-default">
	<label id="result" ></label>
</div>
<div>
	프로필 사진 :
	<c:if test="${dto.profile == null}">
		<img src="http://img.cgv.co.kr/R2014/images/common/default_profile.gif" alt="" onerror="errorImage(this, {'type':'profile'})">
	</c:if>
	<c:if test="${dto.profile != null}">
		<img src="/resources/member/img/${dto.profile}" style="max-width: 35%; height: auto;">
	</c:if>
</div>
<div>
	JPG, GIF, BMP 파일만 등록 가능합니다.<br/>
</div>
<div>
	<input type="file" name="upload"/>
</div>
<div>
	<input type="submit" value="등록" class="btn btn-default"/>
	<input type="button" value="취소" onclick="window.close()" class="btn btn-default"/>
</div>

</form>
</div>
</body>