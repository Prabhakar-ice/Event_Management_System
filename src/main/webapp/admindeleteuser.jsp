<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Event</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

	<%@ include file="adminnavbar.jsp" %>

    <div class="container mt-5 d-flex justify-content-center">
        <div class="card shadow p-4" style="width: 50%;">
            <h2 class="mb-4 text-center">Remove User</h2>
            <form action="">
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" id="username" name="username" placeholder="Enter User Name" required>
                </div>
                <button type="submit" class="btn btn-danger w-100" >Delete</button>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <%
    
    	String username = request.getParameter("username");
    	System.out.println("admin delete user page "+username);
    	
    	if(username != null){
    		Connection con = null;
    		Statement stmt = null;
    		try{
    			Class.forName("com.mysql.cj.jdbc.Driver");
    			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventproject","root","8056");
    			
    			 
    			String deletequery ="DELETE FROM eventusers WHERE name='"+username+"';" ;
    			
    			stmt = con.createStatement();
    			
    			int rows = stmt.executeUpdate(deletequery);
    			
    			if(rows > 0){
    				session.setAttribute("result", "User is removed");
    				response.sendRedirect("results/adminsuccess.jsp");
    			}
    			else{
    				session.setAttribute("result", "Cannot find User");
    				response.sendRedirect("results/adminfail.jsp");
    			}
    			
    		}
    		catch(ClassNotFoundException e){
    			session.setAttribute("exception", e);
    			response.sendRedirect("results/exception.jsp");
    			e.printStackTrace();
    		}
    		catch(SQLException e){
    			session.setAttribute("exception", e);
    			response.sendRedirect("results/exception.jsp");
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
    
    %>
    
</body>
</html>
