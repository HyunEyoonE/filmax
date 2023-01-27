<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 공통변수 처리 -->
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}" scope="application"/>
<c:set var="RESOURCES_PATH" value="${CONTEXT_PATH}/resources" scope="application"/>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>FILMAX</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/resources/template/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/template/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/template/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/resources/template/css/plyr.css" type="text/css">
    <link rel="stylesheet" href="/resources/template/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/template/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/template/css/style.css" type="text/css">
    
    <script src="/resources/template/js/jquery-3.3.1.min.js"></script>

</head>

<body>

    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    
    <tiles:insertAttribute name="header" />		  			
	<tiles:insertAttribute name="body"/>
	<tiles:insertAttribute name="foot" />
	
	    <!-- Js Plugins -->
	<script src="/resources/template/js/bootstrap.min.js"></script>
	<script src="/resources/template/js/player.js"></script>
	<script src="/resources/template/js/mixitup.min.js"></script>
	<script src="/resources/template/js/jquery.slicknav.js"></script>
	<script src="/resources/template/js/owl.carousel.min.js"></script>
	<script src="/resources/template/js/main.js"></script>
	
</body>
  	
</html>