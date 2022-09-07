<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="dbconn.jsp" %>    
<%
request.setCharacterEncoding("utf-8");


String id = request.getParameter("memberId");
String pw = request.getParameter("memberPW");
String name = request.getParameter("memberName");
String gender = request.getParameter("memberGender");
String birth = request.getParameter("userBirth");
LocalDate ld = LocalDate.parse(birth);


String email = request.getParameter("memberEmail1") + "@"+ request.getParameter("memberEmail2");
String phone = request.getParameter("memberPhone");
String address = request.getParameter("memberAddress");

Date currentDatetime = new Date(System.currentTimeMillis());
java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());
java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDatetime.getTime());



out.println(id);
out.println(pw);
out.println(name);
out.println(gender);
out.println(birth);
out.println(email);
out.println(phone);
out.println(address);
out.println(timestamp);

String test = "select id from account where id ='" + id +"'";

Statement stmt = conn.createStatement();
ResultSet rstest = stmt.executeQuery(test);

if(rstest.next()){
	rstest.close();
	stmt.close();
	conn.close();
	response.sendRedirect("join.jsp?error=1");
} else{


	String sql = "Insert into account VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, pw);
	pstmt.setString(3, name);
	pstmt.setString(4, gender);
	pstmt.setString(5, birth);
	pstmt.setString(6, email);
	pstmt.setString(7, phone);
	pstmt.setString(8, address);
	pstmt.setTimestamp(9, timestamp);
	rs = pstmt.executeQuery();
	if(rs.next()){
		rs.close();
		stmt.close();
		conn.close();
		session.setAttribute("sessionId", session.getId());
		response.sendRedirect("complete.jsp?result=join");
	}
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>