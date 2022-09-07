<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%

	String id = request.getParameter("memberId");
	String pw = request.getParameter("memberPW");
	
	String sql = "Select id from account where id = ? and passwd = ?";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, pw);
	rs = pstmt.executeQuery();
	if(rs.next()){
		out.println(id);
		out.println(pw);
		session.setAttribute("sessionId", session.getId());
		rs.close();
		
		
		response.sendRedirect("complete.jsp?result=login");
	}else{
		response.sendRedirect("login.jsp?error=1");
	}
			
%>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>