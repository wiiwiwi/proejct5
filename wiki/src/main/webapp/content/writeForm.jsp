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
    <section class="container bd-content border border-5" role="main">
     	<form action="#" method="post" >
		<article class="pt-2">
			
			<div class ="display-4"> <input type="text" placeholder="제목" value="제목입니다."></div>
			<hr>
			<p class="lead"><input type="text" placeholder="부제" value="부제입니다."></p>
			<hr>
			<p><textarea placeholder="부제" value="부제입니다." cols="85" rows="10"></textarea></p>
			<div class="mb-2">			 
				<input type="submit" class="btn btn-primary " value="등록 ">				
				<input type="reset" class="btn btn-primary " value="취소 ">
			</div>
		</article>
		</form>
	</section>
	</div>
</div>
</body>
</html>