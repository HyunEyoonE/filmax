<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/resources/cs/css/main.css" type="text/css">
<script>
	$(function(){
		$("#membertalk").click(function(){
			var popOption = "width = 650px, hright=550px, top=300px, left=300px, scrollbars=yes";
			var openUrl = '/cs/membertalk';
			window.open(openUrl,'pop',popOption);
		})
	});
</script>
<div class="container">
	<!--네비게이션-->
	<div class="filmaxCsSidebarBox">
		<nav>
			<div style="float:left;">
				<a href="/cs/main" ><div class="csMainMenuHome">고객센터 메인</div></a>
				<a href="/cs/faqList"><div class="csMainMenu">자주 찾는 질문</div></a>
				<a href="/cs/newsList"><div class="csMainMenu">공지/뉴스</div></a>
				<a href="/cs/emailCs"><div class="csMainMenu">이메일 문의</div></a>
				<a href="/cs/groupcs"><div class="csMainMenu">단체/대관 문의</div></a>
			</div>
		</nav>
	</div>
	<!--콘텐츠부분-->
	<div class="filmaxCsBodyContainer">
		<div style="margin:0px;paddig:10px;">
			<%--
				자주 찾는 질문 빠른 검색 | 상담톡 이용 | 이메일 문의 |  내 상담 내역 확인
				이미지 600x800으로 생성
			--%>
			<div class="container">
				<div align=center style="width:196px; height:300px; background-color:#e53637; float:left; padding-top:30px;">
					<a href="/cs/faqList">
						<img src="/resources/cs/${mainImg1}" width="100"/>
					</a>
					<div style="padding-top:30px;">
						<a href="/cs/faqList">
							<b style="font-size:1.2em; color:#FFFFFF;">자주 찾는 질문</b>
						</a>
						<form action="/cs/faqSearchList" method="get">
							<input type="text" name="searchValue" size=18/>
							<input type="hidden" name="search" value="title" />
							<input class="btn btn-light" type="submit" value="검색"/>
						</form>
					</div>
					<div align="center">
						<a href="/cs/faqList?keyword=예매" style="color:#FFFFFF;">예매</a>
						<a href="/cs/faqList?keyword=환불" style="color:#FFFFFF;">환불</a>
						<a href="/cs/faqList?keyword=취소" style="color:#FFFFFF;">취소</a>
					</div>
				</div>
			
				<div id="membertalk" align=center style="width:196px; height:300px; background-color:#A9A9A9; float:left; padding-top:30px;">
					<img src="/resources/cs/${mainImg2}" width="100"/>
					<div style="padding-top:30px;">
						<b style="font-size:1.2em; color:#FFFFFF;">상담톡 이용</b> <br/><br/>
						<span style="font-size:0.8em; color:#FFFFFF;">상담톡을 이용해보세요.</span> <br/><br/>
						<button class="btn btn-light">문의하기</button>
					</div>
				</div>
			
				<div align=center style="width:196px; height:300px; background-color:#A9A9A9; float:left; padding-top:30px;">
					<a href="/cs/emailCs">
						<img src="/resources/cs/${mainImg3}" width="100"/>
						<div style="padding-top:30px;">
							<b style="font-size:1.2em; color:#FFFFFF;">이메일 문의</b> <br/><br/>
							<span style="font-size:0.8em; color:#FFFFFF;">24시간 언제든 문의해주세요.</span> <br/><br/>
							<button class="btn btn-light">문의하기</button>
						</div>
					</a>
				</div>
				<div align=center style="width:196px; height:300px; background-color:#A9A9A9; float:left; padding-top:30px;">
					<img src="/resources/cs/${mainImg4}" width="100"/>
					<div style="padding-top:30px;">
						<b style="font-size:1.2em; color:#FFFFFF;">내 상담 내역 확인</b> <br/><br/>
						<span style="font-size:0.8em; color:#FFFFFF;">문의 내역을 확인할 수 있습니다.</span> <br/><br/>
						<button class="btn btn-light">문의하기</button>
					</div>
				</div>
			</div>
			
			<div style="margin:0px; paddig:0px; clear:left">
				<%--
				자주 찾는 서비스
				신용카드 영수증출력 | 아이디 비밀번호 찾기
				예매/취소 내역확인 | 비회원 예매/취소
				멤버십포인트 사용안내 | 관람권 할인쿠폰 등록
				--%>
				<div style="float:left; width:400px; margin-left:10px">
					<h5 style="padding:20px">자주 찾는 서비스</h5>
					<div class="row">
						<%-- 나중에 a태그로 링크 다 걸어주기 --%>
						<a href="#">
							<div class="faqcard" align="center">아이디 / 비밀번호 찾기</div>
						</a>
						<a href="#">
							<div class="faqcard" align="center">예매/취소<br/>내역 확인</div>
						</a>
						<a href="#">
							<div class="faqcard" align="center">비회원<br/>예매/취소</div>
						</a>
						<a href="#">
							<div class="faqcard" align="center">멤버십 포인트<br/>사용안내</div>
						</a>
						<a href="#">
							<div class="faqcard" align="center">관람권 할인쿠폰 등록</div>
						</a>
						<a href="/cs/groupcs">
							<div class="faqcard" align="center">단체 대관<br/>서비스</div>
						</a>
					</div>
				</div>
				<%--
				공지/뉴스 +
				최신순 목록 5개
				[타입] 제목 등록일
				--%>
				<div style="float:left; margin:10px;">
					<h5>공지/뉴스 <button type="button" class="btn btn-light" onclick="location.href='/cs/newsList'">+</button></h5>
					<table class="table">
						<c:forEach var="news" items="${newsList}">
							<tr>
								<td>[${news.typeName}]</td>
								<td>${news.title}</td>
								<td>
									<fmt:formatDate value="${news.reg}" type="date"/>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>