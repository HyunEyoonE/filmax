	$(function(){
		//영화관 타입 선택하면 지역리스트 받아오기
		$("#cinematype").change(function(){
			getRegionByCinemaType();
		});
		//지역 선택하면 지점 리스트 받아오기
		$("#region").change(function(){
			getBranchByCinemaTypeRegion();
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
		//유효성 검사
		$("#groupcsForm").submit(function(){
			//영화관 종류 선택
			if($("#cinematype").val() == ""){
				alert("영화관 종류를 선택해주세요.");
				$("#cinematype").focus();
				return false;
			}
			//지역 선택
			if($("#region").val() == ""){
				alert("지역을 선택해주세요.");
				$("#region").focus();
				return false;
			}
			//지점 선택
			if($("#branch").val() == ""){
				alert("지점을 선택해주세요.");
				$("#branch").focus();
				return false;
			}
			//관람 희망일
			if($("#wantdate").val() == ""){
				alert("관람 희망일을 선택해주세요.");
				$("#wantdate").focus();
				return false;
			}
			//관람 희망 시간 wanttime
			if($("#wanttime").val() == ""){
				alert("관람 희망 시간을 선택해주세요.");
				$("#wanttime").focus();
				return false;
			}
			//희망 인원 countpeople
			if($("#countpeople").val() == ""){
				alert("희망 인원을 입력해주세요.");
				$("#countpeople").focus();
				return false;
			}
			//내용
			if($("#content").val() == ""){
				alert("내용을 입력해주세요.");
				$("#content").focus();
				return false;
			}
			//문의자명 csname
			if($("#csname").val() == ""){
				alert("문의자명을 입력해주세요.");
				$("#csname").focus();
				return false;
			}
			//연락처
			if($("#phone").val() == ""){
				alert("연락처를 입력해주세요.");
				$("#phone").focus();
				return false;
			}
			//이메일 email
			if($("#email").val() == ""){
				alert("이메일을 입력해주세요.");
				$("#email").focus();
				return false;
			}
			//개인정보 수집 및 이용 동의 isagree
			if($("input:radio[id=isagree]:checked").length < 1){
				alert("개인정보 수집 및 이용 동의를 선택해주세요.");
				$("#isagree").focus();
				return false;
			}
			if($("input:radio[id=isagree]:checked").val() == "0"){
				alert("개인정보 수집 및 이용에 동의하지 않으면 문의를 진행할 수 없습니다.");
				$("#isagree").focus();
				return false;
			}
			
		});
	});
	//영화관 지역 리스트 받아오기
	function getRegionByCinemaType(){
		$.ajax({
			type : "get",
			url : "/cs/getRegionByCinemaType",
			data : {cinematype : $("#cinematype").val()},
			success : function(value){
				var ntext="";
				var options = "<option value="+ntext+">지역 선택</option>";
			    for(i=0 ; i < value.length ; i++){
			    	options += "<option value="+value[i]+">"+value[i];
			    }
			    $("#region").html(options);
			}
		});
	}
	//영화관 지점 리스트 받아오기
	function getBranchByCinemaTypeRegion(){
		$.ajax({
			type : "get",
			url : "/cs/getBranchByCinemaTypeRegion",
			data : {
				cinematype : $("#cinematype").val(),
				region : $("#region").val()
			},
			success : function(value){
				var ntext="";
				var options = "<option value="+ntext+">지점 선택</option>";
			    for(i=0 ; i < value.length ; i++){
			    	options += "<option value="+value[i].BRANCH_ID+">"+value[i].BRANCHNAME;
			    }
			    $("#branch").html(options);
			}
		});
	}