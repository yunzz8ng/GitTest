<%@page import="common.JDBConnect"%>
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
<%
	JDBConnect jdbc = new JDBConnect();

	String searchid = request.getParameter("searchid");
	ResultSet rs = null;	

	try{

	String sql = "SELECT * from member where id =?";
	PreparedStatement psmt = jdbc.con.prepareStatement(sql);
	rs = psmt.executeQuery(sql);
	psmt.setString(1, searchid);
		rs.getString("id");
	
	while (rs.next()){
		
	
		
		String id = rs.getString(1);
		String pw = rs.getString(2);
		String name = rs.getString("name");

		java.sql.Date regidate = rs.getDate("regidate");
		
		out.println("<b>ID:</b>" + id + "<br>");
		out.println("<b>pass:</b>" + pw + "<br>");
		out.println("<b>이름:</b>" + name + "<br>");
		out.println("<b>가입일:</b>" + regidate + "<br>");
		out.println("<hr>");
	}
	}catch(SQLException e){
		out.println("데이터베이스 접속 에러");
	}
	jdbc.close();
%>
</body>
</html>