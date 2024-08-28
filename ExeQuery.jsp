<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.ResultSet"%>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "common.JDBConnect"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원 목록 조회 테스트</h2>
<%
JDBConnect jdbc = new JDBConnect();

String sql = "SELECT id, pass, name, regidate FROM member";
Statement stmt = jdbc.con.createStatement();

ResultSet rs = stmt.executeQuery(sql);

while (rs.next()){
	String id = rs.getString(1);
	String pw = rs.getString(2);
	String name = rs.getString("name");

	java.sql.Date regidate = rs.getDate("regidate");
	
	out.println(String.format("%s %s %s %s", id, pw, name, regidate) + "<br>");
	out.println("<b>ID:</b>" + id + "<br>");
	out.println("<b>pass:</b>" + pw + "<br>");
	out.println("<b>이름:</b>" + name + "<br>");
	out.println("<b>가입일:</b>" + regidate + "<br>");
}
jdbc.close();
%>
</body>
</html>