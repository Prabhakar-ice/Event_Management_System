package dao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface UsersQuery {


	int registerUser(HttpServletRequest request, HttpServletResponse response);

	void checkLogin(HttpServletRequest request, HttpServletResponse response);

	
}
