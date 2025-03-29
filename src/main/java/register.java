

import java.io.IOException;
import java.io.PrintWriter;

import dao.UsersDatabase;
import dao.UsersQuery;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class register
 */
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		UsersQuery register = new UsersDatabase();
		
		System.out.println("register");
		
		int rowsInserted = register.registerUser( request, response);
		if (rowsInserted > 0) {
    		out.println("<script>alert('Registeration is succes, You can login Now..');</script>");
            response.sendRedirect("results/registersuccess.jsp"); // Redirect to login page on success
        } else {
            out.println("<script>alert('Registration failed. Please try again.');</script>");
//            session.setAttribute("result", "Registration failed. Please try again.");
            response.sendRedirect("results/registerfail.jsp");
        }
	}

}
