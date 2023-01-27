<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<h1>/filmax/guest/LoginForm</h1>
<h3>비회원 로그인</h3>

<form action="/member/guest/loginPro" method="post">
	생년월일 : <input type="text" name="birth" placeholder="년-월-일" maxlength='10'/><br/>
	ex) 1996-12-31<br/>
	연락처 : <input type="text" name="phone" maxlength='11' /><br/>
	비밀번호 : <input type="password" name="password" /><br/>
		<input type="submit" value="로그인" /><br/>
</form>