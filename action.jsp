<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.Statement" %>
<%@ page import="common.JDBConnect" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String action = request.getParameter("action");


String employee_id = request.getParameter("employee_id");
String employee_name = request.getParameter("employee_name");
String department = request.getParameter("department");
String hire_date = request.getParameter("hire_date");
String salary = request.getParameter("salary");

JDBConnect jdbc = new JDBConnect();

switch (action) {
	case "insert":
		String insertSql = "INSERT INTO employees (employee_id, employee_name, department, hire_date, salary) values (?, ?, ?, ?, ?)";
		PreparedStatement psmt = jdbc.con.prepareStatement(insertSql);
		psmt.setString(1, employee_id);
		psmt.setString(2, employee_name);
		psmt.setString(3, department);
		psmt.setString(4, salary);
		psmt.setString(5, hire_date);
		
		int inResult = psmt.executeUpdate();
		
		out.println(inResult + "행이 생성 되었습니다");
		break;
		
	case "update":
		String updateSql = "update employees set (employee_id, employee_name, department, hire_date, salary) values (?, ?, ?, ?, ?)";
		PreparedStatement psmt1 = jdbc.con.prepareStatement(updateSql);
		psmt1.setString(1, employee_id);
		psmt1.setString(2, employee_name);
		psmt1.setString(3, department);
		psmt1.setString(4, hire_date);
		psmt1.setString(5, salary);
		
		int inResult1 = psmt1.executeUpdate();
		
		out.println(inResult1 + "수정 되었습니다");
		break;
		
	case "delete":
		String deleteSql = "delete from employees where employee_id = ?";
		PreparedStatement psmt2 = jdbc.con.prepareStatement(deleteSql);
		psmt2.setString(1, employee_id);
		
		int inResult2 = psmt2.executeUpdate();
		
		out.println(inResult2 + "삭제 되었습니다");
		break;
		
	case "select":
		String selectsql = "SELECT * FROM employees";
		Statement stmt = jdbc.con.createStatement();
		
		ResultSet rs = stmt.executeQuery(selectsql);	

	while (rs.next()){

		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("<td>"+rs.getString(2)+"</td>");
		out.println("<td>"+rs.getString(3)+"</td>");
		out.println("<td>"+rs.getString(4)+"</td>");
		out.println("<td>"+rs.getString(5)+"</td>");
		out.println("</tr>" + "<br>");
		
		}
		break;
	}
jdbc.close();
%>
</body>
</html>