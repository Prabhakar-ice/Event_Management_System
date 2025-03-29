package dao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UsersDatabase implements UsersQuery{


	@Override
	public int registerUser(HttpServletRequest request,HttpServletResponse response) {
		String username = request.getParameter("username");
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");
	    
	    System.out.println("register page "+username);
	    
	    Connection con = Database.getConnection();
	    Statement stmt = null;
	    int rowsInserted =0;
	    if(email != null && password != null && username != null){
		    try{
//		    	Class.forName("com.mysql.cj.jdbc.Driver");
		    	 con = Database.getConnection();
		    	
		    	String insertquery = "insert into eventusers(name,email,password,role) values('"+username+"','"+email+"','"+password+"','USER');" ;
		    	 stmt = con.createStatement();
		
		    	rowsInserted = stmt.executeUpdate(insertquery);
		    }
		     catch (SQLException e) {
		    	
	//	        out.println("<script>alert('Database error: " + e.getMessage() + "');</script>");
	//	        session.setAttribute("result", e);
//		        response.sendRedirect("results/registerfail.jsp");
		        e.printStackTrace();
		        
		    } finally {
		        // Close resources
		        try {
		            if (stmt != null) stmt.close();
		            if (con != null) con.close();
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }  
	    }
	    return rowsInserted;
	}

	@Override
	public void checkLogin(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		String password =request.getParameter("password");
		
		System.out.println("login ");
		
		Connection con = null ;
		Statement stmt = null;
		
		if(email != null || password != null){
			try{
				PrintWriter out = response.getWriter();
				HttpSession session = request.getSession(true);
				
				con = Database.getConnection();
				
				stmt=con.createStatement();
				
				ResultSet rs =stmt.executeQuery("select name,password,role from eventusers where email='"+email+"'");

				if(rs.next()){
					session.setAttribute("username", rs.getString(1));
					
					if(password.equals(rs.getString(2))){
						session.setAttribute("role", rs.getString(3));
						if(session.getAttribute("role").equals("ADMIN")){
						response.sendRedirect("admin.jsp");
						}
						else{
							response.sendRedirect("user.jsp");
						}
					}
					else{
						out.println("<script>alert('Password is wrong Please')</script>");
					}
				}
				else{
					out.println("<script>alert('Cannot Find your account, please register')</script>");
				}
			}
			catch(SQLException e) {
				
			}
			catch(IOException e) {
				
			}
			finally{
				try {
		            if (stmt != null) stmt.close();
		            if (con != null) con.close();
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
			}
		}
		
	}
}
