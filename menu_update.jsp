<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.ResultSet"%>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.PreparedStatement" %>
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

String employee_id = "0007";
String employee_name = "짜장면";
String department = "중식";
String hire_date = "2024-08-29";
String salary = "5000";

String sql = "update employees set employee_name = ?, department = ?, hire_date = ?, salary = ? where employee_id = ?";

PreparedStatement psmt = jdbc.con.prepareStatement(sql);

psmt.setString(1, employee_name);
psmt.setString(2, department);
psmt.setString(3, hire_date);
psmt.setString(4, salary);
psmt.setString(5, employee_id);

int inResult = psmt.executeUpdate();
out.println(inResult + "행이 입력되었습니다.");

psmt.close();
jdbc.close();
%>
</body>
</html>