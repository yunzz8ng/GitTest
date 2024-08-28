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

String id = "test3";
String pass = "3333";
String name = "테스트3";

String sql = "update member set pass = ?, name =? where id = ?";
PreparedStatement psmt = jdbc.con.prepareStatement(sql);

psmt.setString(1, id);
psmt.setString(2, pass);
psmt.setString(3, name);

int inResult = psmt.executeUpdate();
out.println(inResult + "행이 입력되었습니다.");

jdbc.close();
%>
</body>
</html>