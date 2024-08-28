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
<h2>메뉴 목록 조회 테스트</h2>
<%
JDBConnect jdbc = new JDBConnect();

String sql = "SELECT employee_id, employee_name, department, hire_date, salay FROM employees";
Statement stmt = jdbc.con.createStatement();

ResultSet rs = stmt.executeQuery(sql);

while (rs.next()){
	String id = rs.getString("employee_id");
	String name = rs.getString("employee_name");
	String dep = rs.getString("department");
	String date = rs.getString("hire_date");
	String sal = rs.getString("salay");

	//java.sql.Date regidate = rs.getDate("regidate");
	
	out.println("<b>ID:</b>" + id + "<br>");
	out.println("<b>MENU:</b>" + name + "<br>");
	out.println("<b>종류:</b>" + dep + "<br>");
	out.println("<b>입점일:</b>" + date + "<br>");
	out.println("<b>가격:</b>" + sal + "<br>");
}
jdbc.close();
%>
</body>
</html>