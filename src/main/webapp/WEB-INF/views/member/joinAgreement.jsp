<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<h1>http://localhost:8080/member/joinAgreement</h1>
<html>
<head>
<title>FILMAX 회원가입정보 </title>
<script type="text/javascript"  >
	$(document).ready(function(){
		//전체 체크박스 클릭
		$("#allCheck").click(function(){
			if ($("#allCheck").prop("checked")){
				$(".all_list").prop("checked", true);
			}else{
				$(".all_list").prop("checked",false);
			}
		});
		//전체 체크박스 선택중 체크박스 하나를 풀었을떄 "전체" 체크해제
		$(".all_list").click(function(){
			if($("input[name='mydate']:checked").length == 3){
				$("#allCheck").prop("checked",true);
			}else{
				$("#allCheck").prop("checked",false);
			}
		});
		// 필수체크박스에 체크가 안될경우 다음 페이지로 안넘어감.
		$("#btn").click(function(){
	    	if(!$("#ch1").prop("checked")){
	    		alert("필수항목에 체크하세요");
	    		return false;	
	    	}
	    	if(!$("#ch2").prop("checked")){
	    		alert("필수항목에 체크하세요");
	    		return false;	
	    	}
	    	if(!$("#ch3").prop("checked")){
	    		alert("필수항목에 체크하세요");
	    		return false;	
	    	}
	    	window.location="join"; 
		});
	});
</script>
<style>
	#joinAgreement{
		border : 5px solid #0e0e0e; /* 박스 테두리 */
		width : 380px;
		height : 300px;
		margin: 200px auto;
	}
	*{
		box-sizing: border-box;
	
	}
</style>
</head>
<body>
<div id="joinAgreement">
<form>
	<div>
		<h2>회원가입</h2>
	</div>
	<div>
		<h4>약관동의 및 실명확인 절차를 거쳐야 가입이 가능합니다.</h4>
	</div>
	<div>
		<h4>이용약관동의</h4>
	</div>
	<div>
		<input type="checkbox" name="mydate" id="allCheck" />
		<label id="agreement1" class="checkbox-inline">전체 동의합니다.</label>
	</div>
	<div>
		<input type="checkbox" id="ch1" name="mydate" class="all_list" value="1" />
		<label id="agreement1" class="checkbox-inline">이용약관 동의 (필수)</label>
	</div>
	<div>
		<input type="checkbox" id="ch2" name="mydate" class="all_list" value="1" />
		<label id="agreement1" class="checkbox-inline">개인정보 수집ㆍ이용동의 (필수)</label>
	</div>
	<div>
		<input type="checkbox" id="ch3" name="mydate" class="all_list" value="1" />
		<label id="agreement1" class="checkbox-inline">본인은 만14세 이상입니다.(필수)</label>
	</div>
	<div>
		<input type="button" value="회원가입"  id="btn" class="btn btn-default" >
	</div>
</form>
</div>
</body>
</html>
	