<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<h1>http://localhost:8080/member/updatePro</h1>

<c:if test="${count == 0 }">
	<script>
		alert("현재 비밀번호를 확인하세요.");
		history.go(-1);
	</script>
</c:if>

<c:if test="${count == 1 }">
	<script>
		alert("회원정보가 변경되었습니다.");
		window.location="/member/main" ;
	</script>
</c:if>