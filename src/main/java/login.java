

import java.io.IOException;
import java.io.PrintWriter;

import dao.UsersDatabase;
import dao.UsersQuery;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class login
 */
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		UsersQuery login = new UsersDatabase();
		
		System.out.println("register");
		login.checkLogin(request, response);
		
	}

}
