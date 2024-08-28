<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>아이디</th>
		<th>가입일</th>
	</tr>
	<%
	String id = "root";
	String pwd = "r1r2r3";
	String url = "jdbc:mariadb://localhost:3307/ezen";
	String driverName = "org.mariadb.jdbc.Driver";
	
	Class.forName(driverName); // JDBC 드라이버 로드하기
	Connection con = DriverManager.getConnection(url, id, pwd); // 데이터베이스 연결하기
	String sql = "SELECT * FROM USER_INFO";
	Statement stmt = con.createStatement(); //Connection으로 Statement 객체 생성하기
	ResultSet rs = stmt.executeQuery(sql); // 쿼리 실행하기
	
	//connection - statement - resultset 순서대로 만들기
	
	while (rs.next()) { // 결과 집합을 순회하며 데이터 출력하기
	    out.println("<tr>");
	    out.println("<td>" + rs.getString("UI_NUM") + "</td>");
	    out.println("<td>" + rs.getString("UI_NAME") + "</td>");
	    out.println("<td>" + rs.getString("UI_ID") + "</td>");
	    out.println("<td>" + rs.getString("CREDAT") + "</td>");
	    out.println("</tr>");
	}
	//종료 순서 
	rs.close();
	stmt.close();
	con.close();
%>
</table>
<a href="/user/user-insert.jsp">회원등록</a>
</body>
</html>