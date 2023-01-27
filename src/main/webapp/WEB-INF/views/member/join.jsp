<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>    
<h1>http://localhost:8080/member/join</h1>
<html>
<head>
<title>FILMAX 회원가입</title>

</head>
<style>
	#join{
		border : 5px solid #0e0e0e; /* 박스 테두리 */
		width : 370px;
		height : 450px auto;
		margin: 150px auto;
	}
	*{
		box-sizing: border-box;
	
	}
</style>
<script>
	$(function(){ //아이디 중복확인
		$("#idCheck").click(function(){
			$.ajax({
				type:"get",
				url : "/member/idCheck",
				data : {user_id:$("#user_id").val()},
				success : function(value){
					if(value == 1){
						$("#result").css("color","red");
						$("#result").text("이미 사용중인 아이디입니다.");
					}else{
						$("#result").css("color","green");
						$("#result").text("사용가능한 아이디 입니다.");
					}
				}
			});
		});
	});
	$(function(){ //이메일 중복확인
		$("#emailCheck").click(function(){
			$.ajax({
				type:"get",
				url : "/member/emailCheck",
				data : {email:$("#email").val()},
				success : function(value){
					if(value == 1){
						$("#result2").css("color","red");
						$("#result2").text("이미 사용중인 이메일입니다.");
					}else{
						$("#result2").css("color","green");
						$("#result2").text("사용가능한 이메일입니다.");
					}
				}
			});
		});
	});
	function pwCheck(){	//첫비밀번호 글자수 체크
		var pw = document.getElementById('user_pw').value;
		if(pw.length < 4 || pw.length > 20) {
			$("#pwResult").text("4 ~ 20글자이내로 입력해주세요.");
			$("#pwResult").css("color", "black");
		}else{
			$("#pwResult").text("사용가능합니다.");
			$("#pwResult").css("color", "green");
		}
	}
	function pwdCheck() { //비밀번호 체크 맞는지 확인
		var pw = document.getElementById('user_pw').value;
		var pwd = document.getElementById('user_pwd').value;
	      if(pw.length < 4 || pw.length > 20) {
				$("#pwdResult").text("4 ~ 20글자이내로 입력해주세요.");
				$("#pwdResult").css("color", "black");
			}
	        if( pw != pwd ) {
				$("#pwdResult").text("비밀번호가 일치하지 않습니다.");
	        	$('#pwdResult').css("color","red");
	        } else{
				$("#pwdResult").text("비밀번호가 일치합니다.");
	        	$("#pwdResult").css("color","green");
	          return true;
	        }
	    }
</script>
<body>
<div id="join">
<form action="joinPro" method="post" enctype="multipart/form-data" class="form-inline">
	<div>
		<h1>FILMAX 회원가입</h1>
	</div>
	<div>
		<label>아이디</label>
		<input type="text" name="user_id" id="user_id" placeholder="아이디를 입력해주세요" maxlength="20" class="form-control"/>
		 <input type="button" value="ID중복확인" id="idCheck" class="btn btn-default"/><label id="result" ></label>
	</div>
	<div>
		<label>패스워드</label>
		<input type="password" name="user_pw" id="user_pw" onclick="pwCheck()" maxlength="20" class="form-control"/><label id="pwResult" ></label>
	</div>
	<div>
		<label>패스워드 확인 </label>
		<input type="password" name="user_pwd" id="user_pwd" onclick="pwdCheck()" maxlength="20" class="form-control"/><label id="pwdResult" ></label>
	</div>
	<div>
		<label>이 름</label>
		<input type="text" name="name" id="name" class="form-control"/>
	</div>
	<div>
		<label>생년월일</label>
		<input type="text" name="birth" placeholder="생년월일 8자리" class="form-control"/>
	</div>
	<div>
		<label>성 별</label>
		<input type="radio" name="gender" value="m" />남자 &nbsp;&nbsp;&nbsp;
		<input type="radio" name="gender" value="w" />여자
	</div>
	<div>
		<label>핸드폰</label>
		<input type="text" name="phone" placeholder="-없이 잆력" class="form-control"/>
		<input type="button" value="인증번호" onclick="" class="btn btn-default"/>
	</div>
	<div>
		<label>이메일</label>
		<input type="text"	name="email" id="email" placeholder="filmax@gmail.com"  class="form-control"/>
		<input type="button" value="E-mail중복확인" id="emailCheck" class="btn btn-default"/><label id="result2" ></label>
	</div>
	<div>
		<label>마케팅 동의</label>
		<label class="checkbox-inline">
			<input type="checkbox" name="marketing" class="all_list" value="1" />광고ㆍ이벤트 알림(선택)
		</label>
	</div>
	<div>
		<input type="submit" value="가입하기" class="btn btn-default"/>	
	</div>
</form>
</div>
</body>
</html>