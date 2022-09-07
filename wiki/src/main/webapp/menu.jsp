<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	String sessionId = (String) session.getAttribute("sessionId");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header class="container-fluid">
<nav class="navbar navbar-expand-sm navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="<c:url value="/main.jsp"/>"><strong>Wiki</strong></a>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
      <c:choose>
      	<c:when test="${empty sessionId}">
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="<c:url value="/login.jsp"/>">로그인</a>
	        </li>
	        <li class="nav-item">
          <a class="nav-link active" href="/join.jsp">회원가입</a>
     		</li>
        </c:when>
        <c:otherwise>
        <li class="nav-item">
        	<div>
          	<a class="nav-link active" aria-current="page" href="<c:url value="/logout.jsp"/>">로그아웃</a>
          	</div>
        </li>
        </c:otherwise>
        </c:choose>
        

        <li class="nav-item">
          <a class="nav-link active" href="#">게시물</a>
        </li>
      </ul>
  	</div> 	
  	<div>
	    <form class="d-flex">
	      <input class="form-control me-2 w-50 justify-content-end" type="search" placeholder="Search" aria-label="Search">
	      <button class="btn btn-outline-success" type="submit">Search</button>
	    </form>
    </div>
  </div>
</nav>

<hr>
</header>


</body>
</html>