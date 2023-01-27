<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/resources/cs/css/main.css" type="text/css">
<script>
$(function(){
	//필수 항목 유효성검사
	$("#emailCsForm").submit(function(){
		//문의 유형
		if($("input:radio[id=etype]:checked").length < 1){
		    alert("문의 유형을 선택해주세요.");
		    $("#etype").focus();
		    return false;
		}
		//영화관 선택 여부
		if($("input:radio[id=thchoice]:checked").length < 1){
		    alert("영화관 선택 여부를 선택해주세요.");
		    $("#thchoice").focus();
		    return false;
		}
		//영화관을 선택했을 때
		if($("input:radio[id=thchoice]:checked").val() == 1){
			//지역
			if($("#region").val() == ""){
				alert("지역을 선택해주세요.");
				$("#region").focus();
				return false;
			}
			//지점
			if($("#branch_seq").val() == ""){
				alert("지점을 선택해주세요.");
				$("#branch_seq").focus();
				return false;
			}
		}
		//제목
		if($("#title").val() == ""){
		    alert("제목을 입력해주세요.");
		    $("#title").focus();
		    return false;
		}
		//내용
		if($("#content").val() == ""){
		    alert("내용을 입력해주세요.");
		    $("#content").focus();
		    return false;
		}
	});
	//지역선택시 영화관 리스트 받기
	$("#region").change(function(){
		$.ajax({
			type : "get",
			url : "/cs/getBranchByRegion",
			data : {region : $("#region").val()},
			success : function(value){
				var ntext="";
				var options = "<option value="+ntext+">지점 선택</option>";
			    for(i=0 ; i < value.length ; i++){
			    	options += "<option value="+value[i].branch_seq+">"+value[i].branchName;
			    }
			    $("#branch_seq").html(options);
			}
		});
	});
	//내용 박스 글자수 처리
	$('.text_box textarea').keyup(function(){
		var content = $(this).val();
		$('.text_box .count span').html(content.length);
		if (content.length > 2000){
			alert("최대 2000자까지 입력 가능합니다.");
	    	$(this).val(content.substring(0, 2000));
	    	$('.text_box .count span').html(2000);
		}
	});
});

</script>

<div class="container">
	<!--네비게이션-->
	<div class="filmaxCsSidebarBox">
		<nav>
			<div style="float:left;">
				<a href="/cs/main" ><div class="csMainMenu">고객센터 메인</div></a>
				<a href="/cs/faqList"><div class="csMainMenu">자주 찾는 질문</div></a>
				<a href="/cs/newsList"><div class="csMainMenu">공지/뉴스</div></a>
				<a href="/cs/emailCs"><div class="csMainMenuHome">이메일 문의</div></a>
				<a href="/cs/groupcs"><div class="csMainMenu">단체/대관 문의</div></a>
			</div>
		</nav>
	</div>
	<!--콘텐츠부분-->
	<div class="filmaxCsBodyContainer">
		<%-- 
		이메일문의
		자주찾는 질문에서 원하는 답변을 찾지 못하셨군요
		불편사항이나 문의사항을 남겨주시면 최대한 신속하게 답변 드리겠습니다.
		--%>
		<h3>이메일 문의</h3>
		<p>자주찾는 질문에서 원하는 답변을 찾지 못하셨군요<br/>
		불편사항이나 문의사항을 남겨주시면 최대한 신속하게 답변 드리겠습니다.</p>
		
		<%-- 
		체크(*)된 항목은 필수 입력 사항입니다.
		이름 이름
		휴대전화 번호 | 이메일 이메일
		※ 문의에 대한 빠른 답변을 위해 회원 가입 시 입력하신 연락처를 확인해주세요. 수정버튼
		문의유형* 문의 불만 칭찬 제안 분실물(radio)
		영화관 선택 선택하지 않음 선택함(radio) 국내 지역 영화관(select)
		제목* 제목
		내용* 내용(textarea)
			※문의 내용 및 첨부파일 내에 개인정보(신용카드번호, 계좌번호, 주민번호 등)가 포함되지 않도록 유의하시기 바랍니다.
								0/5000bite (0/2500자)
		첨부파일 파일선택버튼 선택된 파일 없음
		취소버튼(cs/main)   | 등록하기
		--%>
		<form id="emailCsForm" action="/cs/emailCsPro" method="post" enctype="multipart/form-data">
			<table class="table">
				<tr>
					<th colspan="4" align="right">
						체크(<font color="red">*</font>)된 항목은 필수 입력 사항입니다.
					</th>
				</tr>
				<tr>
					<td>이름</td>
					<td colspan="3">
						${memberDTO.name}
						<input type="hidden" name="name" value="${memberDTO.name}"/>
					</td>	
				</tr>
				<tr>
					<td>휴대전화</td>
					<td>
						${memberDTO.phone}
						<input type="hidden" name="phone" value="${memberDTO.phone}"/>
					</td>
					
					<td>이메일</td>
					<td>
						${memberDTO.email}
						<input type="hidden" name="email" value="${memberDTO.email}"/>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						※ 문의에 대한 빠른 답변을 위해 회원 가입 시 입력하신 연락처를 확인해주세요.
						<%-- 회원정보 수정페이지로 이동 되게 수정 --%>
						<button class="btn btn-light" type="button" onclick="window.location='/member/update'">수정</button>
					</td>
				</tr>
				<tr>
					<td>
						문의유형<font color="red">*</font>
					</td>
					<td colspan="3">
						<c:forEach var="typeDTO" items="${typeList}">
							<input type="radio" id="etype" name="etype" value="${typeDTO.num}"/>${typeDTO.name}
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td>
						영화관 선택
					</td>
					<td colspan="3">
						<input type="radio" id="thchoice" name="thchoice" value="0" /> 선택하지 않음
						<input type="radio" id="thchoice" name="thchoice" value="1" /> 선택함
						<select class="form-select" aria-label="Default select example" id="region" name="region">
							<option value="">지역 선택</option>
							<c:forEach var="region" items="${regionList}">
								<option value="${region}">${region}</option>
							</c:forEach>
						</select>
						<select class="form-select" aria-label="Default select example" id="branch_seq" name="branch_seq">
							<option>지점 선택</option>
						</select>
						
					</td>
				</tr>
				<tr>
					<td>
						제목<font color="red">*</font>
					</td>
					<td colspan="3">
						<input type="text" id="title" name="title" />
					</td>
				</tr>
				<tr>
					<td>
						내용<font color="red">*</font>
					</td>
					<td colspan="3">
						<div class="text_box">
							<textarea rows="20" cols="80" id="content" name="content"></textarea>
							<div class="count"><span>0</span>/2000</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						첨부파일
					</td>
					<td colspan="3">
						<input type="file" name="upload"/>
					</td>
				</tr>
				<tr>
					<td>
						<button class="btn btn-light">취소</button>
					</td>
					<td colspan="3" align="right">
						<input class="btn btn-light" type="submit" value="등록하기"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
