

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dao.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class searchevents
 */
@WebServlet("/searcheventsurl")
public class searchevents extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String searchTitle = request.getParameter("title");
		String username = request.getParameter("username");
		
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        System.out.println("search servlet"+searchTitle);
        
        PreparedStatement stmt = null;
        
        try {
            String sql ;
            Connection con = Database.getConnection();
            
            if(username != null) {
            	sql = "SELECT title, description, time, location, date, participants, imagename FROM events WHERE createdby= ? AND title LIKE ? order by date ASC";
            	
            	 stmt = con.prepareStatement(sql);
                 stmt.setString(1,  username ); // Partial search
                 stmt.setString(2, "%" + searchTitle + "%");
            }else {
            	sql = "SELECT title, description, time, location, date, participants, imagename FROM events WHERE title LIKE ? order by date ASC";
                stmt = con.prepareStatement(sql);
                stmt.setString(1, "%" + searchTitle + "%"); // Partial search
                
            }
            
            // Dynamic SQL Query with Wildcard Search
             
            ResultSet rs = stmt.executeQuery();

            boolean hasEvents = false;

            while (rs.next()) {
                hasEvents = true;
                out.println("<div class='col'>");
                out.println("<div class='card h-100 shadow-lg'>");
                out.println("<img src='images/" + rs.getString("imagename") + "' class='card-img-top' alt='Event Image'>");
                out.println("<div class='card-body text-left'>");
                out.println("<h5 class='card-title'>" + rs.getString("title") + "</h5>");
                out.println("<p class='card-text'>" + rs.getString("description") + "</p>");
                out.println("<p><strong>Time:</strong> " + rs.getString("time") + "</p>");
                out.println("<p><strong>Location:</strong> " + rs.getString("location") + "</p>");
                out.println("<p><strong>Date:</strong> " + rs.getString("date") + "</p>");
                out.println("<p><strong>Participants:</strong> " + rs.getString("participants") + "</p>");
                out.println("<a href='join.jsp?eventname=" + rs.getString("title") + "' class='btn btn-primary'>Join Event</a>");
                out.println("</div></div></div>");
            }

            if (!hasEvents) {
                out.println("<div align='center' class='col-12 text-center'><p class='text-danger'>No events found!</p></div>");
            }

            rs.close();
            stmt.close();
            con.close();
            
        } catch (Exception e) {
            out.println("<p class='text-danger'>Error: " + e.getMessage() + "</p>");
        }
		
	}

	

}
