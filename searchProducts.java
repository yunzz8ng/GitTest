package common;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class searchProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public searchProducts() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	    String searchId = request.getParameter("searchId");
	    String searchType = request.getParameter("searchType");
	  
	    ResultSet rs = null;
	    JDBConnect jdbc = new JDBConnect();
	    
	    
	    try {
	    	
	        String sql;
	        
	        if ("all".equals(searchType)) {
	      
	            sql = "SELECT * FROM products";
	            jdbc.stmt = jdbc.con.createStatement();
	            rs = jdbc.stmt.executeQuery(sql);
	        } else {
	 
	            sql = "SELECT * FROM products WHERE category = ?";
	            jdbc.psmt = jdbc.con.prepareStatement(sql);
	            jdbc.psmt.setString(1, searchId);
	            rs = jdbc.psmt.executeQuery();
	        } 
	        

	        while (rs.next()) {

	        	response.setContentType("text/html; charset=UTF-8");
	        	PrintWriter writer = response.getWriter();
	        		
	        	
	                writer.println("ID: " + rs.getString("product_id") +"<br>");
	                writer.println("NAME: " + rs.getString("product_name") +"<br>");
	                writer.println("CATEGORY: " + rs.getString("category") +"<br>");
	                writer.println("PRICE: " + rs.getString("price") +"<br>");
	                writer.println("DESCRIPTION: " + rs.getString("description") +"<br>");
	                writer.println("STOCK_QUANTITY: " + rs.getString("stock_quantity") +"<br> <hr>");
	               


	                
	            
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();

	    } finally {
	        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
	        if (jdbc.psmt != null) try { jdbc.psmt.close(); } catch (SQLException e) { e.printStackTrace(); }
	        if (jdbc.con != null) try { jdbc.con.close(); } catch (SQLException e) { e.printStackTrace(); }
	    }
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		
	}

}
