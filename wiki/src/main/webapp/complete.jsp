<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>

<meta charset="UTF-8">
<title>위키 프로젝트</title>
<%@include file ="menu.jsp" %>
</head>
<body>
<div class="container-fluid">
	<%if(request.getParameter("result").equals("join")) {%>    
    <section class="container bd-content" role="main">
		<article>
			<div class ="jumbotron display-3">회원가입 성공</div>
			<hr>
			<p class="lead">로그인 후 서비스를 이용하실 수 있습니다.</p>
			<a class="btn btn-primary" href="./login.jsp">로그인</a>
		</article>
	</section>
	<%} %>
	
	<%if(request.getParameter("result").equals("login")) {%>    
    <section class="container bd-content" role="main">
		<article>
			<div class ="jumbotron display-3">로그인 성공</div>
			<hr>
			<p class="lead">서비스를 이용하실 수 있습니다.</p>
			<a class="btn btn-primary" href="./main.jsp">메인으로</a>
		</article>
	</section>
	<%} %>
</div>
</body>
</html>