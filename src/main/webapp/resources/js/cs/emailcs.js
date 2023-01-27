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
			getbranchList();
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
	//영화관 리스트 받기
	function getbranchList(){
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
	}