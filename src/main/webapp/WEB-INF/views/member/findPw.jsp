<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<h1>http://localhost:8080/member/findPw</h1>
<html>
<head>
<title>FILMAX 회원비밀번호 찾기</title>
<script>
$(function(){
	$("#pwch").click(function(){
		$.ajax({
			url : "findPwPro",
			type: "post",
			data:{user_id:$("#user_id").val(),name:$("#name").val(),phone:$("#phone").val()},
			success:function(test){
				if(test==""){
					$("#findPw").css("color","red");
					$("#findPw").text("일치하는 회원정보의 비밀번호가 없습니다.확인해주세요~");
				}else{
					$("#findPw").text("pw="+test);
				}
				
			}
		});	
	});
});
	
</script>
<style>
	#findPw{
		border : 5px solid #0e0e0e; /* 박스 테두리 */
		width : 380px;
		height : 370px;
		margin: 200px auto;
	}
	*{
		box-sizing: border-box;
	
	}
</style>
</head>
<body>
<div id="findPw">
<form method="post"  class="form-inline">
	<div>
		<div>
			<h2>FILMAX 회원비밀번호 찾기</h2>
		</div>
	</div>
	<div>
		<label>아이디</label>  
		<div>
			<input type="text" id="user_id" name="user_id" placeholder="아이디" class="form-control"/><br/>
		</div>
	</div>
	<div>
		<label>이 름</label>
		<div>
			<input type="text" id="name" name="name" placeholder="이 름" class="form-control"/>
		</div>
	</div>
	<div>
		<label>핸드폰</label>
		<div>
			<input type="text" id="phone" name="phone" placeholder="-없이 잆력" class="form-control"/>
		</div>
	</div>
	<div>
	 <p>※ 휴대폰 번호가 변경된 경우 본인인증 찾기를 통하여 비밀번호찾기를 진행해주시기 바랍니다.</p>
	</div>
	<div>
			<input type="button" id="pwch" value="비밀번호 찾기" class="btn btn-default"/>&nbsp;&nbsp;&nbsp;
			<input type="button" value="로그인" onclick="window.location='loginForm'" class="btn btn-default"/>
	</div>
</form>
</div>
</body>
</html>