<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/resources/cs/css/main.css" type="text/css">

<div class="container">
	<!--네비게이션-->
	<div class="filmaxCsSidebarBox">
		<nav>
			<div style="float:left;">
				<a href="/member/main">			<div class="csMainMenu">마이페이지 메인</div></a>
				<a href="/member/main">			<div class="csMainMenu">예매내역</div></a>
				<a href="/member/myCouponList">	<div class="csMainMenu">관람권/할인쿠폰</div></a>
				<a href="/member/myPointList">	<div class="csMainMenu">포인트</div></a>
				<a href="/member/main">			<div class="csMainMenu">이벤트 참여내역</div></a>
				<a href="/member/main">			<div class="csMainMenu">기프트샵</div></a>
				<a href="/member/update">		<div class="csMainMenuHome">회원정보</div></a>
				<a href="/member/update">		<div class="csMainMenu">프로필 관리</div></a>
				<a href="/cs/main">				<div class="csMainMenu">나의 문의내역</div></a>
				<a href="">						<div class="csMainMenu">내가 본 영화</div></a>
			</div>
		</nav>
	</div>
	<!--콘텐츠부분-->
	<div class="filmaxCsBodyContainer">
		
		<style>
			#update{
				border : 5px solid #0e0e0e; /* 박스 테두리 */
				width : 400px;
				height : 450px auto;
				margin: 50px auto;
			}
			*{
				box-sizing: border-box;
			
			}
		</style>
		<script>
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
			var pw = document.getElementById('user_pwd').value;
			if(pw.length < 4 || pw.length > 20) {
				$("#pwResult").text("4 ~ 20글자이내로 입력해주세요.");
		       	$('#pwResult').css("color","black");
			}else{
				$("#pwResult").text("사용가능합니다.");
				$("#pwResult").css("color", "green");
			}
		}
		function pwdCheck() { //비밀번호 체크 맞는지 확인
			var pw = document.getElementById('user_pwd').value;
			var pwd = document.getElementById('user_pwCh').value;
		      if(pw.length < 4 || pw.length > 20) {
					$("#pwdResult").text("4 ~ 20글자이내로 입력해주세요.");
		        	$('#pwdResult').css("color","black");
				}
		        if( pw != pwd ) {
					$("#pwdResult").text("비밀번호가 일치하지않습니다.");
		        	$('#pwdResult').css("color","red");
		        } else{
					$("#pwdResult").text("비밀번호가 일치합니다.");
		        	$("#pwdResult").css("color","green");
		          return true;
		        }
		    }
		function pwCheck() {
			var pw1 = document.getElementsByName("user_pwd")[0].value;
			var pw2 = document.getElementsByName("user_pwCh")[0].value;
			if(pw1 != pw2){
				alert('새로운 비밀번호가 다릅니다.');
				return false;
			}
		}
		
		</script>
		
		<div id="update">
		<form action="/member/updatePro" method="post" class="form-inline">
			<div>
				<h3>FILMAX 회원수정</h3>
			</div>
			<div>
				<label>아이디</label>
				<input type="text" name="user_id" id="user_id" value="${dto.user_id}"  maxlength="20" class="form-control" />
			</div>
			<div>
				<label>현재 패스워드</label>
				<input type="password" name="user_pw" id="user_pw" class="form-control" placeholder="현재 패스워드입력" maxlength="20" /><br />
			</div>
			<div>
				<label>새로운 패스워드</label>
				<input type="password" name="user_pwd" id="user_pwd" onclick="pwCheck()"class="form-control" placeholder="새로운 패스워드"maxlength="20" /><label id="pwResult" ></label><br />
			</div>
			<div>
				<label>패스워드 확인</label>
				<input type="password" name="user_pwCh" id="user_pwCh" onclick="pwdCheck()" class="form-control" placeholder="새로운 패스워드 확인"maxlength="20" /><label id="pwdResult" ></label><br />
			</div>
			<div>
				<label>이름</label>
				<input type="text" name="name" id="name" value="${dto.name}"  class="form-control" />
			</div>
			<div>
				<label>생년월일</label>
				<input type="text" name="birth" class="form-control" value="${dto.birth}"/>
			</div>
			<div>
				<label>성별</label>
				<c:if test="${dto.gender=='m'}">
					<input type="radio" name="gender" value="m" checked />남자&nbsp;&nbsp;&nbsp;
					<input type="radio" name="gender" value="w" />여자<br />
				</c:if>
				<c:if test="${dto.gender=='w'}">
					<input type="radio" name="gender" value="m"  />남자&nbsp;&nbsp;&nbsp;
					<input type="radio" name="gender" value="w" checked />여자<br />
				</c:if>
				
			</div>
			<div>
				<label>연락처</label>
				<input type="text" name="phone" placeholder="-없이 잆력" value="${dto.phone}" class="form-control" />
			</div>
			<div>
				<label>이메일</label>
				<input type="text"	name="email" id="email" placeholder="filmax@gmail.com" value="${dto.email}" class="form-control" />
				<input type="button" value="중복확인" id="emailCheck" class="btn btn-default"><label id="result2" ></label><br />
			</div>
			<div>
				<label>마케팅동의</label>
				<label class="checkbox-inline">
					<input type="checkbox" name="marketing" class="all_list" value="1" <c:if test="${dto.marketing == '1'}">checked</c:if>/>광고ㆍ이벤트 알림(선택)
				</label>
			</div>
			<div>
				<input type="submit"  value="수 정"  class="btn btn-default"/>
				<input type="button"  value="취 소"  class="btn btn-default" onclick="window.location='main'"/>
			</div>		
		</form>
		</div>	
	</div>
</div>

