package dao;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class EventDatabase implements EventQuery{

	@Override
	public int addEvent(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession(false);
		
		response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
//		
//       
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String location = request.getParameter("location");
		String time = request.getParameter("time");
		String date = request.getParameter("date");
		String imagename = (String) session.getAttribute("imagename");
		int participants = 0;
		String createdby = (String) session.getAttribute("username");
		
		System.out.println(createdby);
		
		Connection con = null;
		PreparedStatement stmt = null;
		int row =0;
		
		try {
			con = Database.getConnection();
		
			String query = "INSERT INTO events(title,description,location,date,time,createdby,participants,imagename) values(?,?,?,?,?,?,?,?);" ;
			stmt = con.prepareStatement(query);
			
			stmt.setString(1, title);
			stmt.setString(2, description);
			stmt.setString(3, location);
			stmt.setString(4, date);
			stmt.setString(5, time);
			stmt.setString(6, createdby);
			stmt.setInt(7, participants);
			stmt.setString(8, imagename);
			
			row = stmt.executeUpdate();
		}
		catch(SQLException e) {
			System.out.println("Error" + e.getMessage());
		}finally {
			try {
	            if (stmt != null) stmt.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
		}
		
		return row;
		
	}

	@Override
	public int deleteEvent(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession(false);
	
		String title = request.getParameter("title");
    	String username = (String)session.getAttribute("username");
    	System.out.println("delete page "+ username+" "+title);
    	
    	int row =0;
    	
    	if(title != null){
    		Connection con = null;
    		Statement stmt = null;
    		
    		try{
    			con = Database.getConnection();
    			
    			String selectquery ="select imagename from events where title='"+title+"';" ;
    			stmt = con.createStatement();
    			ResultSet rs = stmt.executeQuery(selectquery);
    			
    			String imagename =null;
    			
    			if(rs.next()) {
    				imagename = rs.getString(1);
    			}
    			
    			String deletequery;
    			
    			if(session.getAttribute("role").equals("ADMIN")){
    				deletequery ="DELETE FROM events WHERE title='"+title+"';" ;
    			}
    			else{
    			 	deletequery = "DELETE FROM events Where title='"+title+"' AND createdby ='"+username+"';" ;
    			}
    			stmt = con.createStatement();
    			
    			 row = stmt.executeUpdate(deletequery);
    			 
    			if(row > 0) {
    				if(imagename != null) {
    					String imagepath = "C:/Users/prabh/eclipse workspace jee/Event_Management_System/src/main/webapp/images/"+imagename;
    	    			File file = new File(imagepath);
    	    			
    	    			if (file.exists() && file.delete()) {
                            System.out.println("Image deleted successfully: " + imagename);
                        } else {
                            System.out.println("Image not found or couldn't be deleted: " + imagename);
                        }
    				}
    			}
    			
    		}
    		catch(SQLException e){
    			session.setAttribute("exception", e);
    			try {
					response.sendRedirect("results/exception.jsp");
				} catch (IOException e1) {
					e1.printStackTrace();
				}
    			e.printStackTrace();
    		}
    		finally {
   			 try {
   		            if (stmt != null) stmt.close();
   		            if (con != null) con.close();
   		        } catch (SQLException e) {
   		            e.printStackTrace();
   		        }
    		}
    	}
    	
    	return row;
	}	
	
}
