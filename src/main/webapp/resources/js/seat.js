$(function(event){
	// 선택 인원수와 선택 좌석의 개수가 같을때 결제로 이동
	var numOfPeople;
	var seat;
	var total;

	// 인원수 버튼 눌렀을때 이벤트 
	$(".btn-numPeople").on('click',function(event){
		numOfPeople = event.target.id;
		var clickedPeople = document.getElementById("numOfClickedPeople");
		
		// 선택한 인원수 표시 
		clickedPeople.innerHTML = numOfPeople;
		$("#numOfClickedSeat").html("");
		/*
		$.ajax({
			type: "get",
			url: "",
			data: {  },
			success: function(value){
				//console.log(value);
				//$("#branchList").html(value);
			}
		});	
		*/
	});
	
	//좌석 클릭했을때 이벤트 함수
	// 좌석 이름 표시 
	// 금액 계산
	$(".btn-seat").on('click',function(event){
		var seatNameId = event.target.id;	// 확정된 자리 sequence로 디비로 넘기기 
		var seatName = event.target.value;
		var count;
		var clickedSeats = [];
		
		console.log('seatNameId: '+seatNameId);
		console.log('seatNameValue: '+seatName);
		var clickedSeat = document.getElementById("numOfClickedSeat");
		
		
		//clickedSeat.innerHTML = seatName;
		$("#numOfClickedSeat").append(seatName);
		//$("#numOfClickedSeat").toggle();
		
		// 선택 인원수와 클릭 좌석수가 같을때까지 
		
	});
	
	$(".ck-seat").on('click', function(event){
		var seatNameId = event.target.id;	// 확정된 자리 sequence로 디비로 넘기기 
		var seatName = event.target.value;
		var clickedSeatCnt = $(".ck-seat:checked").length;
		var clickedSeat = [];
		
		// 선택한 좌석 리스트에 seat_seq push
		$(".ck-seat:checked").each(function(i){
			clickedSeat.push($(this).attr('id'));
		});
		 
		console.log('seatNameId: '+seatNameId);
		console.log('seatNameValue: '+seatName);
		console.log('numOfPeople: '+numOfPeople);
		console.log('checked: '+clickedSeatCnt);
		//console.log('Array: '+clickedSeat[0]);

		// 선택한 좌석명 화면 출력
		$("#numOfClickedSeat").append(seatName);
		
		// 선택 인원수와 클릭 좌석수가 같을때
		// 데이터 보내고 금액출력 
		// 좌석 선택 불가처리 
		if(clickedSeatCnt == numOfPeople){
			$.ajax({
				type: "post",
				url: "/ticket/seatPrice",
				data: {seatArray: clickedSeat},
				traditional: true,
				success: function(data){
					$("#sumOfPrice").html(data+'원 ');
					$("#total").val(data);
				}
			});
		}
	});
	
	/*
	$(".btn-payout").on('click', function(){
		location.href='/ticket/payout?timetableId=${timetableId}&total=${price}';
	});
	*/
});