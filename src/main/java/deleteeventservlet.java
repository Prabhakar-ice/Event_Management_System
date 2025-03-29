

import java.io.IOException;

import dao.EventDatabase;
import dao.EventQuery;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class deleteeventservlet
 */
public class deleteeventservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		EventQuery deleteevent = new EventDatabase();
		HttpSession session = request.getSession(false);
		int row = deleteevent.deleteEvent(request, response);
		
		if(row > 0){
			session.setAttribute("result", "Event is Deleted");
			session.setAttribute("option","Go Back");
			response.sendRedirect("results/success.jsp");
		}
		else{
			session.setAttribute("result", "Cannot find Event");
			response.sendRedirect("results/fail.jsp");
		}
	}

}
