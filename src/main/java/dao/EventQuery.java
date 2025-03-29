package dao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface EventQuery {

	int addEvent(HttpServletRequest request, HttpServletResponse response);

	int deleteEvent(HttpServletRequest request, HttpServletResponse response);

	
}
