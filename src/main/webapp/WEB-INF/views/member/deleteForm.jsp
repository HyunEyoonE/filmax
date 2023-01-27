<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<h1>http://localhost:8080/member/deleteForm</h1>

<html>
<head>
<title>FILMAX 회원탈퇴</title>

<style>
	#deleteForm{
		border : 5px solid #0e0e0e; /* 박스 테두리 */
		width : 350px;
		height : 200px;
		margin: 300px auto;
	}
	*{
		box-sizing: border-box;
	
	}
</style>
</head>
<body>
<div id="deleteForm">
<form action="/member/deletePro" method="post" class="form-inline">
	<div>
		<h1>FILMAX 회원탈퇴</h1>
	</div>
	<div>
		<label>아이디</label>
		<input type="text" name="user_id" id="user_id" value="${dto.user_id}" disabled="disabled" maxlength="20" class="form-control" />
	</div>
	<div>
		<label>패스워드</label>
		<input type="password" name="user_pw" id="user_pw" onclick="pwCheck()"class="form-control" maxlength="20" /><label id="pwResult" ></label><br />
	</div>
	<div>
		<input type="submit" id="delete" value="탈퇴하기"  class="btn btn-default"/>
		<input type="button" value="취소" onclick="window.location='main'" class="btn btn-default"/>
	</div>
</form>
</div>	
</body>
</html>