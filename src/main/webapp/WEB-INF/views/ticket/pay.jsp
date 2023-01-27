<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="/resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
/* 포인트 영역 */
.point_div{
	margin-top: 30px;
    margin-bottom: 50px;
}
.point_div_subject{
	font-size: 25px;
    line-height: 35px;
    font-weight: bold;
}
.point_table{
	border-color: #ddd;
    border-spacing: 0;
    border-top: 1px solid #363636;
    border-bottom: 1px solid #b6b6b6;
}
.point_table th{
	border-color: #ddd;
    vertical-align: top;
    text-align: center;
    color: #333333;
    background: #eaeaea;
    text-indent: 0;
    padding: 12px 5px 12px 10px;
    font-size: 15px;
    line-height: 20px;
}
.point_table_td{
	border-color: #ddd;
    text-align: left;
    color: #333333;
    padding: 8px 15px;
}
.order_point_input_btn{
	vertical-align: middle;
    display: inline-block;
    border: 1px solid #aaa;
    width: 60px;
    text-align: center;
    height: 20px;
    line-height: 20px;
    color: #555;
    cursor: pointer;
    font-size: 12px;
}
</style>


<script>
var total= ${total};
var inputPoint;
var ckCoupon=0;

$(function(){
	$("#step1detail").css("display","block");
	$("#step2detail").css("display","block");
	$("#step3detail").css("display","block");
	
	// 전체선택
	$("#allCheck").click(function(){
		if ($("#allCheck").prop("checked")){
			$(".all_list").prop("checked", true);
		}else{
			$(".all_list").prop("checked", false);
		}
	});
	
	// 모두선택후 체크해제하면 전체선택박스 해제
	$("input[name=useBox]").click(function() {
		var totalcheck = $("input[name=useBox]").length;
		var checked = $("input[name=useBox]:checked").length;
		if(totalcheck != checked) $("#allCheck").prop("checked", false);
		else $("#allCheck").prop("checked", true); 
		
		ckCoupon = $(this).val();
		let listCkCoupon= ckCoupon.split(" ");
		// listCkCoupon[1];	// 선택한 쿠폰 가격
		// 선택한 쿠폰 가격
		
		if($(this).is(":checked")==true){
			total = total-parseInt(listCkCoupon[1]);
			ckCoupon = parseInt(listCkCoupon[0]);
	    }else{
	    	total = total+parseInt(listCkCoupon[1]);
	    	ckCoupon = "NULL";
	    }
		$("#pay-total").html('<div id="pay-total">'+total+ '원</div>');
		
	});
   
	
	/* 포인트 입력 */
	//0 이상 & 최대 포인트 수 이하
	$(".order_point_input").on("propertychange change keyup paste input", function(){
		const maxPoint = parseInt('${pointCount}');	
		let inputValue = parseInt($(this).val());	
		
		if(inputValue < 0){
			$("#pointValue").val(0);
		} else if(inputValue > maxPoint){
			$("#pointValue").val(maxPoint);
		}	
	});
	
	// 포인트 모두사용, 취소 버튼 // Y: 모두사용상태, N : 모두취소상태
	$(".order_point_input_btn").click(function(){ // 모두사용 누르면
		const maxPoint = parseInt('${pointCount}'); // 보유포인트 모두사용
		let state = $(this).data("state"); // class 속성값 저장 Y/N
		if(state == 'N') { // 모두사용
			console.log("n동작");
			$("#pointValue").val(maxPoint); // 값변경
			// 글변경
			$("#pointCancel").css("display", "inline-block");
			$("#pointAll").css("display", "none");
		} else if(state == 'Y') { // 사용취소
			console.log("y동작");
			$("#pointValue").val(0); // 값변경
			// 글변경
			$("#pointCancel").css("display", "none");
			$("#pointAll").css("display", "inline-block");
		}
	});
	
	$(".apply").click(function(){
		inputPoint= document.getElementById('pointValue').value;
		$("#pay-total-point").html(inputPoint+" Point");

		total = total-inputPoint;
		$("#pay-total").html(total);
	});
});

</script>
<div id="step1div">step1.</div>

<div id="step1detail" style="display:none;">
	<form action="/gorder/gorderPro" method="post">
	<div class="point_div">
		<div class="point_div_subject">할인쿠폰</div>
		<table class="point_table" border="1" style="text-align: center">
			<colgroup>
				<col width="10%">
				<col width="*">
			</colgroup>
		<input type="button" value="전체 쿠폰" id="allCoupon" onclick="window.open('/member/myCouponList', '모든쿠폰 보기', 'width=500, height=500')"/>
			<tbody>
			<tr>
				<!-- checkbox 선택버튼 -->
				<td><input type="checkbox" value="allCheck" id="allCheck"/></td>
				<td>쿠폰 이름</td>
				<td>할인 금액</td>
				<td>사용여부</td>
				<td>유효기간</td>
			</tr>
			
			<c:forEach items="${mylist}" var="dto">
			<tr>
				<c:if test="${dto.use == true}"><td>사용됨</td> </c:if>
				<c:if test="${dto.use == false}">
					<td><input type="checkbox" value="${dto.num} ${dto.sale}" name="useBox" class="all_list"/></td>
				</c:if>
				<td>${dto.name}</td>
				<td>${dto.sale}원</td>
				<c:if test="${dto.use == true}"> <td>사용불가</td></c:if>
				<c:if test="${dto.use == false}"> <td>사용가능</td></c:if>
				<td>~<fmt:formatDate value="${dto.usetime}" type="date"/>까지</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	</form>
</div>

<div id="step2div">step2.</div>

<div id="step2detail" style="display:none;">
	<form action="/gorder/gorderPro" method="post">
		<div class="point_div">
		<div class="point_div_subject">포인트 사용</div>
		<table class="point_table">
			<colgroup>
				<col width="10%">
				<col width="*">
			</colgroup>
			<tbody>
				<tr>
					<th>포인트 사용</th>
					<td>
						보유 포인트 ${pointCount}원 |
						<input id="pointValue" class="order_point_input" value="0" style="width:70" style="text-align:right"/>원 
						<a id="pointAll" class="order_point_input_btn" data-state="N">모두사용</a>
						<a id="pointApply" class="order_point_input_btn apply">적용</a>
						<a id="pointCancel" class="order_point_input_btn" data-state="Y" style="display: none;">사용취소</a>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	</form>
</div>

<div id="step3div">
	step3.
</div>

<div id="step3detail" style="display:none;">
	<form action="/gorder/gorderPro" method="post">
	<div>
		<h4>사용 포인트</h4>
		<div id="pay-total-point"></div>
		<h4>최종결제금액</h4>
		<div id="pay-total">${total} 원</div>
	</div>
	</form>
</div>

<button id="check_module" type="button"><img src="/resources/pay/payment_icon_yellow_medium.png"></button>
<script>
	$("#check_module").click(function () {
		var IMP = window.IMP; // 생략가능
		IMP.init("imp30642645");  
		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
		// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
		console.log(IMP);
		IMP.request_pay({
			pg: 'kakaopay',
			pay_method: 'kakaopay',
			merchant_uid: 'merchant_' + new Date().getTime(),
			/* 
			 *  merchant_uid에 경우 
			 *  https://docs.iamport.kr/implementation/payment
			 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
			 */
			name: '주문명 : ${selectedMovie.title}',
			// 여기다가 영화명
			// name: '주문명 : ${auction.a_title}',
			// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
			amount: total,
			// amount: ${bid.b_bid},
			//---------------------------------->>> 영화가격가격 <-------------------------------------------------
			buyer_name: '이름',
			// @@@@@@@@@@@@@@@@@@@@@회원에서 정보받아서 이름뜨게 model활용@@@@@@@@@@@@@@@
			// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
			// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
			buyer_postcode: '123-456',
			}, function (rsp) {
				console.log(rsp);
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '결제 금액: ' + rsp.paid_amount;
				// success.submit();
				// 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
				// 자세한 설명은 구글링으로 보시는게 좋습니다.
				
				console.log('movie_seq: '+${selectedMovie.movie_seq});
				console.log('amount: '+total);
				console.log('usingPoint: '+inputPoint);
				console.log('amount: '+ckCoupon);
				$.ajax({
					
					
					url : "/ticket/payData" ,
					data : {movie_seq:${selectedMovie.movie_seq}, amount:total,  usingPoint:inputPoint, coupon_id:ckCoupon},
					type : "post",
					
					success : function (data){
						console.log("결제 DB 저장 완료");
						window.location="/ticket/payResult";
					}
				});
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});
	});
</script>

