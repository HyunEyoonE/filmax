<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<h1>http://localhost:8080/member/findId</h1>

<html>
<head>
<title>FILMAX 회원아이디 찾기</title>
<style>
	#findId{
		border : 5px solid #0e0e0e; /* 박스 테두리 */
		width : 350px;
		height : 350px;
		margin: 200px auto;
	}
	*{
		box-sizing: border-box;
	
	}
</style>
<script>
$(function(){
	$("#idch").click(function(){
		$.ajax({
			url : "findIdPro",
			type:"post",
			data:{name:$("#name").val(),phone:$("#phone").val(),birth:$("#birth").val()},
			success:function(test){
				if(test==""){
					$("#findId").css("color","red");
					$("#findId").text("일치하는 회원정보의 아이디가 없습니다.확인해주세요~");
				}else{
					$("#findId").text("id="+test);
				}
				
			}
		});	
	});
});
	
</script>
</head>
<body>
<div id="findId">
<form method="post" class="form-inline">
	<div>
		<div>
			<h2>FILMAX 회원아이디 찾기</h2>
		</div>
	</div>
	<div>
		<label>이 름</label>  
		<div>
			<input type="text" name="name" id="name" placeholder="이 름" class="form-control"/>
		</div>
	</div>
	<div>
		<label>생년원일</label>  
		<div>
			<input type="text" name="birth" id="birth" placeholder="생년월일앞 8자리" class="form-control"/>
		</div>
	</div>
	<div>
		<label>핸드폰</label>  
		<div>
			<input type="text" name="phone" id="phone" placeholder="-없이 잆력"class="form-control"/>
		</div>
	</div>
	<div>
		<p>※ 휴대폰 번호가 변경된 경우 본인인증 찾기를 통하여 아이디찾기를 진행해주시기 바랍니다.</p>
		<input type="button" value="아이디 찾기" id="idch" class="btn btn-default"/>&nbsp;&nbsp;&nbsp;
		<input type="button" value="비밀번호 찾기" onclick="window.location='findPw'" class="btn btn-default"/>&nbsp;&nbsp;&nbsp;
		<input type="button" value="로그인" onclick="window.location='loginForm'" class="btn btn-default"/>
	</div>

</form>
</div>
</body>
</html>