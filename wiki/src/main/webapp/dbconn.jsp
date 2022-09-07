<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:orcl"; // localhost 뒷부분은 보고 연결.
	String userid = "wiki";
	String pwd = "wiki";
	
	try { // 드라이버 찾기
		Class.forName("oracle.jdbc.driver.OracleDriver"); // 클래스 찾아 객체로 리턴.
		System.out.println("드라이버 로드 성공");
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	
	try {
		System.out.println("데이터베이스 연결 준비 ...");
		conn = DriverManager.getConnection(url, userid, pwd); // 데이터 베이스 연결
		System.out.println("데이터베이스 연결 성공");
	} catch (SQLException e) {
		e.printStackTrace();
	} // 나머지 부분은 모두 예외처리.
%>