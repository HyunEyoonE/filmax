<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<link rel="shortcut icon" href="#">
<h1>member/guest/guestJoin</h1>
<h3>비회원 예매하기</h3>
<script>
	$(function(){ // 연락처 중복확인
		$("#phoneCheck").click(function(){
			$("#signup").attr("type", "button"); // 기본상태=> 버튼
			const phone = $("#phone").val();
			$.ajax({
				type : "post",
				url : "/member/guestIdCheck",
				data : {phone:phone},
				success : function(value) {
					if (value == 1) {
						$("#result").css("color", "red");
						$("#result").text("사용불가");
					} else { // 사용가능이면 버튼 => submit
						$("#result").css("color", "green");
						$("#result").text("사용가능");
						$("#signup").attr("type", "submit");
					}
				},
				error : function() {
					alert("아이디 중복 확인 오류");
				}
			});
		});
	});
	
	function pwCheck() {
		var pw = document.getElementById("password").value;
		if (pw.length < 4 || pw.length > 20) {
			document.getElementById('pwResult').innerHTML="4 ~ 20글자 이내로 입력해주세요.";
			//$("#pwResult").text("4자리 이상 20자리 이내로 입력해주세요");
			$("#pwResult").css("color", "black");
		}
		else {
			document.getElementById('pwResult').innerHTML="사용가능합니다.";
			//$("#pwResult").text("사용가능합니다");
			$("#pwResult").css("color", "green");
		}
	}
	
	function pwdCheck() {
		var pw = document.getElementsById("password").value;
		var pwd = document.getElementById("password_check").value;
		if (pw.length < 4 || pw.length > 20) {
			//document.getElementById('pwdResult').innerHTML="4자리 이상 20자리 이내로 입력해주세요";
			$("#pwdResult").text("4자리 이상 20자리 이내로 입력해주세요");
		}else if (pw != pwd) {
			//document.getElementById('pwdResult').innerHTML="비밀번호가 일치하지 않습니다";
			$("#pwdResult").text("비밀번호가 일치하지 않습니다");
			$("#pwdResult").css("color", "red");
		}else {
			//document.getElementById('pwdResult').innerHTML="비밀번호가 일치합니다";
			$("#pwdResult").text("비밀번호가 일치합니다");
			$("#pwdResult").css("color", "green");
			return true;
		}
	}
	
</script>

<form action="/member/guest/guestJoinPro" method="post">
	개인정보 수집 및 이용동의 : <br/>
	비회원예매 고객께서는 정책에 동의해주셔야 예매가능합니다.	<br/>
			<input type="radio" name="ruleagree" value='1'/>동의함
			<input type="radio" name="ruleagree"/>동의안함<br/>
	생년월일 : <input type="date" name="birth" placeholder="8자리" /><br/>
	연락처 : 	<input type="text" name="phone" id="phone" placeholder="010-xxxx-xxxx" maxlength='11' style="width:114"/>
	
	<button id="phoneCheck" type="button">중복확인</button> <label id="result"></label><br/>
	
	비밀번호 : <input type="password" name="password" id="password" onclick="pwCheck()" maxlength="20" placeholder="4자이상 권장" style="width:120"/>
	<label id="pwResult"></label><br/>
	비밀번호확인 : <input type="password" name="password_check" id="password_check" onclick="pwdCheck()" maxlength="20" style="width:100"/>
	<!-- button type="button" id="pwch">비밀번호 확인</button> -->
	<label id="pwdResult"></label><br/>
			<input type="submit" value="비회원 예매하기" id="signup"/><br/>
</form>
