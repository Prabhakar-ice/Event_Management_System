

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class searchusers
 */
public class searchusers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
		String role = (String) session.getAttribute("role");
		System.out.println(role);
		
		String name = request.getParameter("name");
		
		PrintWriter out = response.getWriter();
		Connection con = null;
		PreparedStatement stmt= null;
		ResultSet rs = null;
		
		try {
			
			con = Database.getConnection();
			
			String searchquery = "SELECT id, name, email, role from eventusers where name like ?";
			
			stmt = con.prepareStatement(searchquery);
			stmt.setString(1, "%" + name + "%");
			rs = stmt.executeQuery();
			
			boolean result = false;
			
			while(rs.next()) {
				result = true;
				
				out.print("<tr>");
				out.print("<td>usr"+rs.getInt("id")+"</td>");
				out.print("<td>"+rs.getString("name")+"</td>");
				out.print("<td>"+rs.getString("email")+"</td>");
				out.print("<td>"+rs.getString("role")+"</td>");
				out.print("</tr>");
				
			}
			
			if(!result) {
				out.print("<tr><td colspan='4'>No Users Found </td> </tr>");
			}
			
		}catch(SQLException e) {
			 e.printStackTrace();
	            out.println("<tr><td colspan='4' class='text-danger'>Error: " + e.getMessage() + "</td></tr>");
		}
		finally {
			try {
				if(rs != null)rs.close();
				if(con != null)con.close();
				if(stmt != null)stmt.close();
			}
			catch(Exception e) {
				
			}
		}
	}

}
