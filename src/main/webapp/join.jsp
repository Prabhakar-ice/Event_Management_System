<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="navbar.jsp" %>
	

	<%
		String eventname = request.getParameter("eventname");
		System.out.println("join page "+eventname);
		
		Connection con = null;
		Statement stmt = null;
		
		int rows = 0;
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventproject", "root", "8056");
			
			//update events set participants = participants + 1 where title = eventname ;
			String updatequery = "UPDATE events SET participants = participants + 1 WHERE title='"+eventname+"';" ;
			
			stmt = con.createStatement();
			rows = stmt.executeUpdate(updatequery);
			
			if(rows > 0){
				session.setAttribute("result"," You Have Joined the Event..!");
				session.setAttribute("option"," ok ");
				response.sendRedirect("results/success.jsp");
			}
			else{
				session.setAttribute("result","Event Not Found");
				response.sendRedirect("results/fail.jsp");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
            session.setAttribute("exception", e.getMessage());
            response.sendRedirect("results/exception.jsp");
        } finally {
            if (stmt != null) stmt.close();
            if (con != null) con.close();
        }
	%>

</body>
</html>