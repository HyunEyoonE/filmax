<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<script src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"></script>
<style>
	#loginForm{
		border : 5px solid #0e0e0e; /* 박스 테두리 */
		width : 320px; /* 박스넓이 */
		height : 300px auto; 
		margin: 200px auto;
		/* filter: drop-shadow(0px 0px 10px rgba(0,0,0,.5));  //그림자 */
	}
	*{
		box-sizing: border-box;
	
	}
</style>
</head>
<script type="text/javascript" >
$(document).ready(function(){
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감
    var userInputId = getCookie("userInputId");	//저장된 쿠키값 가져오기
    $("input[name='user_id']").val(userInputId); 
     
    if($("input[name='user_id']").val() != ""){ 	// 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라
        $("#save_id").attr("checked", true); 	// ID 저장하기를 체크 상태로 유지
    }
    
    $("#save_id").change(function(){ 	// 체크박스에 변화가 발생
        if($("#save_id").is(":checked")){ 	// ID 저장하기 체크했을때
            var userInputId = $("input[name='user_id']").val();
            setCookie("userInputId", userInputId, 7); 	// 7일 동안 쿠키 보관
        }else{ 	// ID 저장하기 체크 해제 시, delteCookie 삭제 
            deleteCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[name='user_id']").keyup(function(){ 	// ID 입력 
        if($("#save_id").is(":checked")){ 	// ID 저장하기를 체크한 상태
            var userInputId = $("input[name='user_id']").val();
            setCookie("userInputId", userInputId, 7); 	// 7일 동안 쿠키 보관
        }
    });
});
 
function setCookie(cookieName, value, exdays){	//생성쿠키 이름값,휴효날짜를 파라미터로 박아서 쿠키를설정
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){	//삭제하는 쿠키 
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {	//얻기쿠키, 쿠키이름을 받아서 들어있는값을 반환
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}
</script>

<!-- Login Section Begin -->
<section class="login spad" style="background: #cccccc;">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="login__form">
                    <h3>로그인</h3>
                    <form action="loginPro" method="post" id="login" class="form-inline">
                        <div class="input__item">
                            <input type="text" name="user_id" id="user_id" placeholder="ID">
                            <span class="icon_profile"></span>
                        </div>
                        <div class="input__item">
                            <input type="password" name="user_pw" placeholder="Password">
                            <span class="icon_lock"></span>
                        </div>
                        <div>
                        	<input type="checkbox" id="save_id" name=save_id> 아이디 저장
                        </div>
                        <br/>    
                    </form>
                    <button type="submit" form="login" value="로그인" id="loginbtn" class="site-btn">Login Now</button>
                    <div class="forget_pass">
                    	<a href="/member/findId"  style="color: #ffffff;">아이디 찾기</a> / 
                    	<a href="/member/findPw"  style="color: #ffffff;">비밀번호 찾기</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="login__register">
                    <h3>아이디가 없으신가요?</h3>
                    <a href="/member/joinAgreement" class="site-btn">회원가입</a>
                    <a href="/member/guest/guestJoin" class="site-btn">비회원 예먜하기</a>
                    <a href="/member/guest/loginForm" class="site-btn">비회원 예매확인</a>
                </div>
            </div>
        </div>
        <div class="login__social">
            <div class="row d-flex justify-content-center">
                <div class="col-lg-6">
                    <div class="login__social__links">
                        <span>or</span>
                        <!-- 네이버 로그인 화면으로 이동 시키는 URL -->
						<!-- 네이버 로그인 화면에서 ID, PW를 올바르게 입력하면 callback 메소드 실행 요청 -->
						<div id="naver_id_login" style="text-align:center"><a href = "${url}">
							<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Login Section End -->

