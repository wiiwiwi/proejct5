<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="col-2">
	    <ul class="list-group">
		  <li class="list-group-item"><a href="<c:url value="/content/view.jsp"/>"/>위키</a></li>
		  <li class="list-group-item"><a href="<c:url value="/BoardListAction.do?pageNum=1"/>"> 게시판 </a></li>
		</ul>	
    </div>
</body>
</html>