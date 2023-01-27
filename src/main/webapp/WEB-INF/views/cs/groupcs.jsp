<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/resources/js/cs/groupcs.js"></script>
<link rel="stylesheet" href="/resources/cs/css/main.css" type="text/css">

<div class="container">
	<!--네비게이션-->
	<div class="filmaxCsSidebarBox">
		<nav>
			<div style="float:left;">
				<a href="/cs/main" ><div class="csMainMenu">고객센터 메인</div></a>
				<a href="/cs/faqList"><div class="csMainMenu">자주 찾는 질문</div></a>
				<a href="/cs/newsList"><div class="csMainMenu">공지/뉴스</div></a>
				<a href="/cs/emailCs"><div class="csMainMenu">이메일 문의</div></a>
				<a href="/cs/groupcs"><div class="csMainMenuHome">단체/대관 문의</div></a>
			</div>
		</nav>
	</div>
	<!--콘텐츠부분-->
	<div class="filmaxCsBodyContainer">
		<h3>단체/대관 문의</h3>
		<p>개인이나 단체를 위한 대관서비스로 FIMLMAX의 넓고 쾌적한 극장에서 즐거운 추억을 만드실 수 있습니다.<br/>
		불편사항이나 문의사항을 남겨주시면 최대한 신속하게 답변 드리겠습니다.</p>
		
		<form id="groupcsForm" action="/cs/groupcsPro" method="post">
			<table class="table">
				<tr>
					<td colspan="4" align="right">
						체크(<font color="red">*</font>)된 항목은 필수 입력 사항입니다.
					</td>
				</tr>
				<tr>
					<td>
						영화관 선택<font color="red">*</font>
					</td>
					<td colspan="3">
						<%-- 테이블 받아와서 옵션 추가하기 --%>
						<select id="cinematype" name="cinematype">
							<option value="">영화관 종류</option>
							<c:forEach var="cinematypeDTO" items="${cinemaTypeList}">
								<option value="${cinematypeDTO.cinemaType_seq}">${cinematypeDTO.typeName}</option>
							</c:forEach>
							<option value="1">1</option>
						</select>
						<select id="region" name="region">
							<option>지역 선택</option>
						</select>
						<select id="branch" name="branch">
							<option>지점 선택</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						관람희망일<font color="red">*</font>
					</td>
					<td>
						<input type="date" id="wantdate" name="wantdate"/>
						<select id="wanttime" name="wanttime">
							<option value="">시간 선택</option>
							<c:forEach var="time" items="${timeList}">
								<option value="${time}">${time}</option>
							</c:forEach>
						</select>
					</td>
					<td>
						희망인원<font color="red">*</font>
					</td>
					<td>
						<input type="number" id="countpeople" name="countpeople"/>
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
					<td>문의자명<font color="red">*</font></td>
					<td>
						<input type="text" id="csname" name="csname"/>
					</td>
					<td>연락처<font color="red">*</font></td>
					<td>
						<input type="text" id="phone" name="phone"/>
					</td>
				</tr>
				<tr>
					<td>이메일<font color="red">*</font></td>
					<td colspan="3">
						<input type="text" id="email" name="email"/>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						개인정보 수집 및 이용에 대한 동의
						<table class="table">
							<tr>
								<th>항목</th>
								<th>이용목적</th>
								<th>보유기간</th>
								<th>동의여부</th>
							</tr>
							<tr>
								<td>
									문의자명, 연락처, 이메일, 문의내용
								</td>
								<td>
									문의 접수 및 회신
								</td>
								<td>
									문의 접수 ~ 처리완료 시점으로부터 6개월간
								</td>
								<td>
									<input type="radio" name="isagree" id="isagree" value="1"/> 동의함<br/>
									<input type="radio" name="isagree" id="isagree" value="0"/> 동의안함
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="4" align="right">
						<button>취소</button> 
						<input type="submit" value="등록하기"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>