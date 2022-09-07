<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>

<meta charset="UTF-8">
<title>위키 프로젝트</title>
<%@include file ="../menu.jsp" %>
</head>
<body>
<div class="container-fluid">
	<div class="row flex-nowrap">
	    <%@include file="../aside.jsp" %>
	    
	    <%-- <div class="col-2">
		    <ul class="list-group">
			  <li class="list-group-item">위키</li>
			  <li class="list-group-item"><a href="<c:url value="/BoardListAction.do?pageNum=1"/>">게시판</a></li>
			</ul>	
	    </div> --%>
	    
    <section class="container bd-content" role="main">
		<article class="pt-5">
			
			<div class ="display-4">환영합니다.</div>
			<hr>
			<p class="lead">This is a lead paragraph. It stands out from regular paragraphs.</p>
			<hr>
			<p>테스트 내용 내용내용내용내용내용</p>
		</article>
	</section>
	</div>
</div>
</body>
</html>