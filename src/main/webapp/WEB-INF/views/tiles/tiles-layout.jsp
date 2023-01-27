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
<html>
  <head>
	<meta charset="UTF-8">
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script src="/resources/js/jquery-3.6.1.min.js"></script>
	<script type="text/javascript">
		var CONTEXT_PATH = "${CONTEXT_PATH}";
		var RESOURCES_PATH = "${RESOURCES_PATH}";
	</script>
	<link href="/resources/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="/resources/static/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- Bootstrap core JavaScript-->
	<script src="/resources/static/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	<!-- Core plugin JavaScript-->
	<script src="/resources/static/vendor/jquery-easing/jquery.easing.min.js"></script>
	
	<!-- Custom scripts for all pages-->
	<script src="/resources/static/js/sb-admin-2.min.js"></script>
	
	<!-- Page level plugins -->
	<script src="/resources/static/vendor/chart.js/Chart.min.js"></script>
    <title><tiles:insertAttribute name="title" /></title>
  </head>
  
  <body id="page-top">
	  	<div id="wrapper">
	  		<tiles:insertAttribute name="left"/>
	  		
	  		<div id="content-wrapper" class="d-flex flex-column">
	            <div id="content">
		  			<tiles:insertAttribute name="header" />
		  			<div class="container-fluid">
		  			
		  				<tiles:insertAttribute name="body"/>
		  				
	  			</div>
		  		</div>
	  		</div>
	  		
	  	</div>
	  	<tiles:insertAttribute name="foot" />
	
  	</body>
  	
</html>