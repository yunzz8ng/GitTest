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
<jsp:include page="hakbun.jsp" flush="true" />
<h2>회원 정보 검색</h2>
<%
    String searchId = request.getParameter("searchId");
    String searchType = request.getParameter("searchType");
  
    ResultSet rs = null;
    JDBConnect jdbc = new JDBConnect();
	
    
    try {

        String sql;
        
        if ("all".equals(searchType)) {
            sql = "SELECT * FROM member";
            jdbc.stmt = jdbc.con.createStatement();
            rs = jdbc.stmt.executeQuery(sql);
        } else {
            sql = "SELECT * FROM member WHERE id = ?";
            jdbc.psmt = jdbc.con.prepareStatement(sql);
            jdbc.psmt.setString(1, searchId);
            rs = jdbc.psmt.executeQuery();
        } 
        

        while (rs.next()) {
            %>
            <p>
                ID: <%= rs.getString("id") %><br>
                Name: <%= rs.getString("name") %><br>
                pass: <%= rs.getString(2) %><br>
                Regidate: <%= rs.getString(4) %>
            </p>
            <%
        }
    } catch (SQLException e) {
        e.printStackTrace();
        %>
        <p>오류가 발생했습니다: <%= e.getMessage() %></p>
        <%
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (jdbc.psmt != null) try { jdbc.psmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (jdbc.con != null) try { jdbc.con.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>

</body>
</html>